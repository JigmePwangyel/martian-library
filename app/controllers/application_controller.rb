class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern

  def current_user
    token = request.headers["Authorization"].to_s
    email = Base64.decode64(token)
    User.find_by(email: email)
  end
end
