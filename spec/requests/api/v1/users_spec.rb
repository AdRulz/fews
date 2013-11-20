require "spec_helper"

describe "get user info", "GET /api/v1/users/id.json" do
  let!(:user) { create :user, token: 'xxx' } # adil.jarulin@gmail.com, 1233321

  context 'as an user himself' do
    before do
      get "/api/v1/users/#{user.id}.json", token: 'xxx'
    end

    it 'success (200)' do
      expect(response).to be_success
    end

    it "respond with user data" do
      expect(response.body).to have_json_path "user/email"
    end
  end

  context 'as an guest' do
    it 'unauthorized (401)' do
      get "/api/v1/users/#{user.id}.json"
      expect(response.status).to eql 401
    end

  end

end
