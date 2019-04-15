class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  http_basic_authenticate_with name: 'user', password: ENV['BASIC_AUTH_PASSWORD'] if Rails.env.production?
end
