class Api::V1::BaseController < InheritedResources::Base
  before_filter :authenticate_with_token
  respond_to :json


  rescue_from CanCan::AccessDenied do |exception|
    render json: { error: exception.message }, status: 401
  end

  protected

  def current_user
    @current_user
  end

  def authenticate_with_token
    token = params[:token]
    if token
      @current_user = User.where({token: token}).first
    else
      @current_user = nil
    end
  end

end
