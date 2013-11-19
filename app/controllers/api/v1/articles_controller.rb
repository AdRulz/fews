module Api::V1
  class ArticlesController < BaseController

    def update
      @article = Article.find(params[:id])
      authorize! :update, @article
      update!
    end

    def permitted_params
      params.permit(:article => [:title, :body])
    end

  end
end
