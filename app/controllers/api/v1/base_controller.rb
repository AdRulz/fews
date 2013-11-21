class Api::V1::BaseController < InheritedResources::Base
  before_filter :authenticate_with_token
  respond_to :json


  rescue_from CanCan::AccessDenied do |exception|
    render json: { error: exception.message }, status: 401
  end

  rescue_from ActionController::ParameterMissing do |exception|
    render json: { error: exception.message }, status: 400
  end

  protected

  def current_user
    @current_user
  end

  def authenticate_with_token
    token = request.headers["X-Auth-Token"]
    if token
      @current_user = User.where({token: token}).first
    else
      @current_user = nil
    end
  end


  def set_cache_buster
    response.headers["Cache-Control"] = "no-cache, no-store, max-age=0, must-revalidate"
    response.headers["Pragma"] = "no-cache"
    response.headers["Expires"] = "Fri, 01 Jan 1990 00:00:00 GMT"
  end

end
