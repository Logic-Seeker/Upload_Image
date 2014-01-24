class PhotosController < ApplicationController
  def index

  end

  def new
    @photo = Photo.new()
  end

  def create
    @photo = Photo.new(photo_params)
    @photo.save
    redirect_to photos_index_path
  end

  def delete
  end

  def show
  end

  private#####################

  def photo_params
     params.require(:photo).permit(:title, :image)
  end
end
