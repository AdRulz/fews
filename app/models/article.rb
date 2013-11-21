class Article < ActiveRecord::Base
  belongs_to :user
  has_many :votes
  validates :title, presence: true
  validates :body, presence: true
  default_scope  { order(votes_count: :desc, created_at: :desc) }

end
