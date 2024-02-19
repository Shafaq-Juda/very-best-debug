class UsersController < ApplicationController

  def home
    redirect_to("/users")
  end

  def index
    matching_users = User.all
    @users = matching_users.order(:created_at)

    render({ :template => "user_templates/all_users"})
  end
  
  def show
    username = params.fetch("username")
    matching_users = User.where({ :username => username })
    @user = matching_users.at(0)

    render({ :template => "user_templates/user_details"})
  end
  
  def create
    user = User.new
    new_user_name = params.fetch("query_username")
    #user.username = params.fetch("query_username")
    user.username = new_user_name
    user.save
    
    redirect_to("/users/#{user.username}")
  end
  
  def update
    user_id = params.fetch("user_id")
    matching_users = User.where({ :id => user_id })
    the_user = matching_users.at(0)
    
    the_user.username = params.fetch("query_username")
    the_user.save
    username = the_user.username
    redirect_to("/users/#{username}", allow_other_host: true)
  end

end
