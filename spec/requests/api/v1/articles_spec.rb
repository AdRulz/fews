require "spec_helper"

describe "GET /api/v1/articles.json" do

  before do
    create :article
    get "/api/v1/articles.json"
  end

  it 'success (200)' do
    expect(response).to be_success
  end


  it "respond with articles" do
    expect(response.body).to have_json_path "articles/0/title"
    expect(response.body).to have_json_path "articles/0/body"
  end

end
