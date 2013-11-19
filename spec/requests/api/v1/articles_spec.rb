require "spec_helper"

describe 'Articles API' do
  let!(:user) { create :user, token: 'xxx' }

  describe "list all articles", "GET /api/v1/articles.json" do
    before do
      create :article
      get "/api/v1/articles.json"
    end

    it 'success (200)' do
      expect(response).to be_success
    end

    it "respond with json collection of articles" do
      expect(response.body).to have_json_path "articles/0/title"
      expect(response.body).to have_json_path "articles/0/body"
    end
  end

  describe "list my articles", "GET /api/v1/articles/my.json" do
    context 'as an authenticated user' do
      it 'success (200)' do
        get "/api/v1/articles/my.json", token: 'xxx'
        expect(response.status).to eql 200
      end
    end

    context 'as an guest' do
      it 'unauthorized (401)' do
        get "/api/v1/articles/my.json"
        expect(response.status).to eql 401
      end
    end
  end

  describe 'vote for article', "POST /api/v1/articles/id.json" do
    let!(:article) { create :article }

    context 'when client_id provided' do
      it 'success (200) for first time' do
        post "/api/v1/articles/#{article.id}/vote.json", client_id: '100'
        expect(response.status).to eql 200
      end

      it 'fails if more than once with the same id' do
        create :vote, article: article, client_id: '100'
        post "/api/v1/articles/#{article.id}/vote.json", client_id: '100'
        expect(response.status).to eql 400
      end

    end

    context 'when client_id missing' do
      it 'bad request (400)' do
        post "/api/v1/articles/#{article.id}/vote.json"
        expect(response.status).to eql 400
      end
    end
  end

  describe 'create new article', "POST /api/v1/articles.json" do

    context 'as an authenticated user' do
      before do
        post "/api/v1/articles.json", article: {title: 'My artile', body: 'Text'}, token: 'xxx'
      end

      it 'created (201)' do
        expect(response.status).to eql 201
      end
    end

    context 'as an guest' do
      before do
        post "/api/v1/articles.json", article: {title: 'My artile', body: 'Text'}, token: ''
      end

      it 'unauthorized (401)' do
        expect(response.status).to eql 401
      end
    end
  end

  describe 'update article', "PUT /api/v1/articles.json" do
    let(:user) { create :user, token: 'xxx' }
    let!(:article) { create :article, user: user }

    context 'as an author' do
      before do
        put "/api/v1/articles/#{article.id}.json/", article: {title: 'Updated title'}, token: 'xxx'
      end

      it 'success (200)' do
        expect(response).to be_success
      end
    end

    context 'as an other user or guest' do
      before do
        put "/api/v1/articles/#{article.id}.json/", article: {title: 'Updated title' }, token: nil
      end

      it 'unauthorized (401)' do
        expect(response.status).to eql 401
      end
    end
  end

  describe 'delete article', "DELETE /api/v1/articles.json" do
    let(:user) { create :user, token: 'xxx' }
    let!(:article) { create :article, user: user }

    context 'as an author' do
      it 'success (204)' do
        delete "/api/v1/articles/#{article.id}.json/", token: 'xxx'
        expect(response.status).to eql 204
      end
    end

    context 'as an other user or guest' do
      it 'unauthorized (401)' do
        delete "/api/v1/articles/#{article.id}.json/"
        expect(response.status).to eql 401
      end
    end
  end

end
