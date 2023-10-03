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
end
