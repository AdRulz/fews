class Article < ActiveRecord::Base
  belongs_to :user
  has_many :votes
  validates :title, presence: true
  validates :body, presence: true
  default_scope  { order(created_at: :desc, votes_count: :desc) }
end
