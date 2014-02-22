class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_flow, :current_user

  def current_flow
    false
  end

  def current_user
    FakeUser.new
  end

end
