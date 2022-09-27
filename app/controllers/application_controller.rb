class ApplicationController < ActionController::Base
  include Pundit
  protect_from_forgery
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  include PublicActivity::StoreController  

  before_action :authenticate_user!

  before_action :set_global_variables, if: :user_signed_in?
  
  def set_global_variables
    @ransack_courses = Course.ransack(params[:courses_search], search_key: :courses_search)
  end

  private

  def user_not_authorized
    flash[:alert] = "Alert - You are not authorized to perform this action."
    redirect_back(fallback_location: root_path)
  end
end
