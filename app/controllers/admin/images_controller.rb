class Admin::ImagesController < ApplicationController
  def create
    if (path = ImageUploader.save params[:file])
      render json: { image: { path: path }}, status: :created
    else
      head :unprocessable_entity
    end
  end
end
