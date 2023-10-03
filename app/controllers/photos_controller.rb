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
    
  def destroy
    photo = Photo.where({id: params.fetch("photo_id")}).first
    #username = photo.poster.username
    #username = user.username
    photo.destroy
    redirect_to("/photos")
    
  end

  def post_photo
    new_photo = Photo.new

    new_photo.image = params.fetch("input_image")
    new_photo.caption = params.fetch("input_caption")
    new_photo.owner_id = params.fetch("input_owner_id")

    new_photo.save

    redirect_to("/photos/#{new_photo.id}")
  end

  def update_photo
    photo = Photo.where({id: params.fetch("photo_id")}).first

    photo.image = params.fetch("input_image")
    photo.caption = params.fetch("input_caption")
    photo.save

    redirect_to("/photos/#{params.fetch("photo_id")}")
  end

  def add_comment
    new_comment = Comment.new
    new_comment.photo_id = params.fetch("input_photo_id")
    new_comment.author_id = params.fetch("input_author_id")
    new_comment.body = params.fetch("input_comment")
    new_comment.save
    redirect_to("/photos/#{params.fetch("input_photo_id")}", allow_other_host: true)

  end
end
