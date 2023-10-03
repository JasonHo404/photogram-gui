class PhotosController < ApplicationController
  def index
    match = Photo.all
    @list_of_photos = match.order({created_at: :desc})
    render({template: "photo_templates/index"})
  end
  
  def show
    @photo = Photo.where({id: params.fetch("photo_id")})
    @photo = @photo[0]


    render({template: "photo_templates/show"})
  end

end
