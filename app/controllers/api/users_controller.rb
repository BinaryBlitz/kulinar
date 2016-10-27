class API::UsersController < API::APIController
  skip_before_action :restrict_access!,
                      only: [
                        :create, :authenticate_vk,
                        :authenticate_fb, :authenticate_email
                      ]
  before_action :set_user, only: :show

  def show
  end

  def create
    @user = User.new(user_params)

    if @user.save
      render status: :created
    else
      render json: @user.errors, status: 422
    end
  end

  def authenticate_vk
    if params[:access_token].present?
      vk = VkontakteApi::Client.new(params[:access_token])
      @user = User.find_or_create_from_vk(vk)
      render :create
    else
      head 422
    end
  rescue VkontakteApi::Error
    head 422
  end

  def authenticate_fb
    if params[:access_token].present?
      fb = Koala::Facebook::API.new(params[:access_token])
      @user = User.find_or_create_from_fb(fb)
      render :create
    else
      head 422
    end
  rescue Koala::Facebook::AuthenticationError
    head 422
  end

  def authenticate_email
    @user = User.find_by(email: params[:email])

    if @user && @user.authenticate(params[:password])
      render json: { api_token: @user.api_token }
    else
      render json: { error: 'Invalid email / password combination' }, status: :unauthorized
    end
  end

  private

  def set_user
    @user = current_user
  end

  def user_params
    params.require(:user).permit(:name, :email, :password)
  end
end
