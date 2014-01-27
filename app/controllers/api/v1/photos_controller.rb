module Api
  module V1
    class PhotosController < ApplicationController
      skip_before_action :verify_authenticity_token
      def index
	@photo = Photo.all
      end

      def create
	if params[:photo][:image].present?
	  tempfile = Tempfile.new("fileupload")
	  tempfile.binmode
	  tempfile.write(Base64.decode64(params[:photo][:image]))
	  uploaded_file = ActionDispatch::Http::UploadedFile.new(:tempfile => tempfile, :filename => params[:photo][:filename], :original_filename => "tram")
	  params[:photo][:image] = uploaded_file
	end
	@photo= Photo.new(photo_params)
	if @photo.save
	  render :json => @photo
	else
	  render :json => {:errors =>@photo.errors}
	end 
      end
      def show
	@photo=Photo.find(params[:id])
      end

      def photo_params
	params.require(:photo).permit(:title, :image)
      end

    end
  end
end


