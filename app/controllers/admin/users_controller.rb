class Admin::UsersController < Admin::AdminController
  def index
    @users = User.search(params[:search])
  end

  def show
    @user = User.find(params[:id])
  end
end
