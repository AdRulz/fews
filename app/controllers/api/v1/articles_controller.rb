module Api::V1
  class ArticlesController < BaseController
    load_and_authorize_resource except: [ :vote, :my ]

    def create
      @article = Article.new permitted_params[:article]
      @article.user = current_user
      create!
    end

    def vote
      article = Article.find(params[:id])
      vote = Vote.new article: article
      if vote.save
        render json: nil, status: 200
      else
        render json: nil, status: 400
      end
    end

    def my
      if current_user
        render current_user.articles
      else
        render json: nil, status: 401
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
