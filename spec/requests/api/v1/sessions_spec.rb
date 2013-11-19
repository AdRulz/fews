require "spec_helper"

describe "login", "POST /api/v1/sessions.json" do
  let!(:user) { create :user } # adil.jarulin@gmail.com, 1233321

  context 'credentials valid' do
    before do
      post "/api/v1/sessions.json", email: 'adil.jarulin@gmail.com', password: '1233321'
    end

    it 'success (200)' do
      expect(response).to be_success
    end

    it "respond with auth token" do
      expect(response.body).to have_json_path "session/token"
    end
  end

  context 'credentials invalid' do

    before do
      post "/api/v1/sessions.json", email: 'adil.jarulin@gmail.com', password: 'wrogpassword'
    end

    it 'forbidden (403)' do
      expect(response.status).to eql 403
    end

  end

end
