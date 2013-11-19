class Api::V1::BaseController < InheritedResources::Base
   respond_to :json

   protected

   def current_user
     @current_user
   end

end
