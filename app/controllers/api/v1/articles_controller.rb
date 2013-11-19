module Api::V1
  class ArticlesController < BaseController
    load_and_authorize_resource

    def permitted_params
      params.permit(:article => [:title, :body])
    end

  end
end
