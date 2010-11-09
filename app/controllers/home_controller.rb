class HomeController < ApplicationController
  before_filter :require_user

  def index
    logger.debug "HomeController::index"
  end
end
