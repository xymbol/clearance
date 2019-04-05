class ApplicationController < ActionController::Base
  include Clearance::Controller

  before_action :require_login

  def show
    if Rails::VERSION::MAJOR >= 5
      render html: "", layout: "application"
    else
      render text: "", layout: "application"
    end
  end
end
