class PhotosController < ApplicationController
  def index
    @photo = Photo.all
  end

  def new
    @photo = Photo.new()
  end

  def create
    @photo = Photo.new(photo_params)
    @photo.save
    redirect_to photos_path
    
  end

  def delete
  end

  def show
  end


  def photo_params
     params.require(:photo).permit(:title, :image)
  end
end
