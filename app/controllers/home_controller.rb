class HomeController < ApplicationController
  def index
    flash.now[:alert] = 'あらと'
    flash.now[:notice] = 'のてぃす'
  end
end
