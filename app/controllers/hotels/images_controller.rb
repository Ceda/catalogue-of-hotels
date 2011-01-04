class Hotels::ImagesController < ApplicationController
  before_filter :find_hotel
  before_filter :authorize_hotel, :except=>[:index]
  before_filter :check_count_images, :only=>:create

  def index
    @images = @hotel.images
    @editable_flag = false #app helper method editable?
  end

  def new
    @images = @hotel.images
  end
   
  def create
    if params[:images] and !params[:images].empty?
      params[:images].each do |image|
        image = Image.new(:image => image, :draft=>false)
        if image.valid?
          @hotel.images << image
          flash[:notice] = t('hotels.images.successfully_create') unless flash[:notice]
        else
          flash[:alert] = image.errors.full_messages.join("; ")
        end
      end
    end    
    redirect_to new_hotel_image_path(@hotel)
  end
  
  #TODO: test router hotel_images_path(@hotel)
  def destroy
    images_ids = params[:images].map(&:to_i)
    Image.destroy_all(["id IN(?) and imageable_type ='Hotel' and imageable_id=?", images_ids, @hotel.id])
    flash[:notice] = t('places.images.form.successfully_destroy')
    redirect_to new_hotel_image_path(@hotel)
  end

private
  def find_hotel
    @hotel = Hotel.find(params[:hotel_id]) 
    if can? :update, @hotel
      @editable_flag = true #app helper method editable?
    end  
  end
  
  def authorize_hotel
    authorize! :update, @hotel
  end
  
  def check_count_images
    if @hotel.images_count > Hotel.images_limit
      flash[:alert] = t("hotels.images.too_many")
      redirect_to new_hotel_image_path(@hotel)
    end
  end
end