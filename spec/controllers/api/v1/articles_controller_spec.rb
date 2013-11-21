require 'spec_helper'

describe Api::V1::ArticlesController do

  describe "create" do
    it "set current user as an author of article" do
      user = create :user
      allow(controller).to receive(:current_user).and_return(user)

      post :create, {article: {title: 'My artile', body: 'Text'}}
      expect(Article.first.user).to eql user
    end

    it "vote for article" do
      article = create :article, votes_count: 0

      expect{
        post :vote, {id: article.id}
        article.reload
      }.to change(article, :votes_count).by(1)

    end
  end

end
