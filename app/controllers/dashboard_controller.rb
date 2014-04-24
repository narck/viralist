class DashboardController < ApplicationController
before_filter :login_check
  def index
  	@stores = Store.all
  end
end