class ApplicationController < ActionController::API
  private
  # source: http://guides.rubyonrails.org/action_controller_overview.html#session
  # Finds the User with the ID stored in the session with the key
  # :current_user_id This is a common way to handle user login in
  # a Rails application; logging in sets the session value and
  # logging out removes it.
  #||=  --> I think it means
  #         - if @_current_user is NOT false or nil, def returns
  #           @current_user
  #         - else it sets @current_user equal to session[...]
  def current_user
    @_current_user ||= session[:current_user_id]
    # && User.find_by(id: session[:current_user_id])
  end
end
