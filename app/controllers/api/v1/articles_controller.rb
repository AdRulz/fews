module Api::V1
  class ArticlesController < BaseController
    load_and_authorize_resource except: [ :vote ]

    def vote
      article = Article.find(params[:id])
      if article.votes.where({client_id: client_id}).empty?
        render json: nil, status: 200
      else
        render json: nil, status: 400
      end

    end


    def permitted_params
      params.permit(:article => [:title, :body])
    end

    def client_id
      params.require(:client_id)
    end

  end
end
