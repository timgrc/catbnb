class Owner::HousesController < ApplicationController
  before_action :find_house, only: [:show, :edit, :update, :destroy]

  def index
    @houses = current_cat.houses
  end

  def new
    @house = House.new
  end

  def create
    @house = House.new(house_params)
    @house.cat = current_cat
    if @house.save
      redirect_to owner_houses_path(@house)
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @house.update(house_params)
      redirect_to owner_houses_path(@house)
    else
      render 'edit'
    end
  end

  def destroy
    @house.destroy
    redirect_to owner_houses_path(@house)
  end

  private

  def house_params
    params.require(:house).permit(
      :name,
      :address,
      :kind,
      :capacity,
      :price,
      :catnip,
      :photo,
      :photo_cache,
      :description
    )
  end

  def find_house
    @house = House.find(params[:id])
  end
end
