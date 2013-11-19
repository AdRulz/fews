require 'spec_helper'

describe Article do

  it "have a title" do
    expect( subject ).to respond_to :title
  end

  it "have a body" do
    expect( subject ).to respond_to :body
  end

  it "have a creaton date" do
    expect( subject ).to respond_to :created_at
  end

  it "belong to user" do
    expect(subject).to belong_to :user
  end

  it "have many votes" do
    expect(subject).to have_many :votes
  end

  describe "votes count" do
    it 'exist' do
      expect( subject ).to respond_to :votes_count
    end

    it "caches votes conunt" do
      article = create :article
      expect {
        create :vote, article: article
        article.reload
      }.to change(article, :votes_count).to(1)
    end

  end


end
