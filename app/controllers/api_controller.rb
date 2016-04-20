class ApiController < ApplicationController
private
  def authenticate_user
    authenticate_or_request_with_http_token do |token, options|
      @current_user = User.find_by(auth_token: token)
    end
  end
end