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

  describe 'ordering' do

    it 'DESC by rating then by date (also DESC)' do
      articles = create_list :article, 4
      create_list :vote, 6, article: articles[0]
      create_list :vote, 6, article: articles[3]
      create_list :vote, 1, article: articles[1]
      create_list :vote, 1, article: articles[2]

      articles[0].votes_count = 6
      articles[1].created_at = Date.yesterday
      # articles[2]
      articles[3].created_at = Date.yesterday
      articles[3].votes_count = 2

      articles.each(&:save)

      expect(Article.all.to_a).to eql [ articles[0], articles[3], articles[2], articles[1]]
    end

  end

end
