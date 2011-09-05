class AdminController < ApplicationController

  #layout 'application'

  rescue_from CanCan::AccessDenied do |exception|
    flash[:error] = exception.message
    redirect_to home_path
  end

  before_filter :authenticate_user!

  def index
    authorize! :do_admin_stuff, :stuff
    #render :layout => 'application'
  end


end
