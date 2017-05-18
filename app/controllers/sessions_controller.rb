# command: rails g controller Sessions create destroy
# source: http://guides.rubyonrails.org/action_controller_overview.html#session
class SessionsController < ApplicationController
  # def set_version_header
  #   response.set_header("Access-Control-Allow-Credentials", "true")
  # end

  def create
    # if there is a user in the database with this particular username and
    # password, set current_user_id to user.id
    @user = User.find_by_name(params[:username])
    if(@user && @user.password == params[:password])
      session[:current_user_id] = @user.id
      current_user
      # set_version_header
      render json: {
        message: "Welcome #{@user.name}, you are logged in!",
        current_user_id: @_current_user
        }
    else
      render json: {message: 'Sorry, the password and username you entered don\'t match!'}
   end
  end

  def show
    current_user
    puts "current user: #{current_user}"
    puts "session: #{session}"
    # set_version_header
    render json: {
      current_user_id: @_current_user
    }
  end

  def destroy
    # Remove the user id from the session
    @_current_user = session[:current_user_id] = nil
    # set_version_header
    render json: {
      message: 'You\'re logged out!',
      current_user_id: @_current_user
    }
  end
end
