class UsersController < ApplicationController 
  def index
    match = User.all

    @list_of_users = match.order({username: :asc})

    render({template: "user_templates/index"})
  end

  def show
    username = User.where({username: params.fetch("username")})
    @user = username[0]
    render({template: "user_templates/show"})
  end

  def add_user
    new_user = User.new
    new_user.username = params.fetch("input_username")
    new_user.save
    redirect_to("/users/#{new_user.username}")
  end

  def update_user
    user = User.where({id: params.fetch("user_id")}).first
    user.username = params.fetch("input_username")
    user.save
    redirect_to("/users/#{user.username}", allow_other_host: true)

  end

end
