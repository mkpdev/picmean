class TinymceAssetsController < ApplicationController
  respond_to :json

  def create
    geometry = Paperclip::Geometry.from_file params[:file]
    image    = Image.create params.permit(:file, :alt, :hint)
    session["image_id"].nil? ? session["image_id"] = [image.id] : session["image_id"] << image.id
    render json: {
      image: {
        url:    image.file.url,
        height: geometry.height.to_i,
        width:  geometry.width.to_i
      }
    }, layout: false, content_type: "text/html"
  end
end