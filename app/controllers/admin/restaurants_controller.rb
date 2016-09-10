class Admin::RestaurantsController < Admin::AdminController
  before_action :set_restaurant, only: [:show, :edit, :update, :destroy]

  def index
    @restaurants = Restaurant.all
  end

  def new
    @restaurant = Restaurant.new
  end

  def show
  end

  def edit
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    if @restaurant.save
      redirect_to admin_restaurants_url, notice: 'Ресторан был успешно создан.'
    else
      render 'new'
    end
  end

  def update
    if @restaurant.update(restaurant_params)
      redirect_to admin_restaurants_url, notice: 'Ресторан успешно обновлен.'
    else
      render :edit
    end
  end

  def destroy
    @restaurant.destroy
    redirect_to admin_restaurants_url, notice: 'Ресторан был успешно удален.'
  end

  private

  def set_restaurant
    @restaurant = Restaurant.find(params[:id])
  end

  def restaurant_params
    params
      .require(:restaurant)
      .permit(
        :name, :description, :address, :phone_number,
        :site_url, :image, :icon, :featured
      )
  end

end
