class Article < ActiveRecord::Base
  belongs_to :user
  has_many :votes
  default_scope  { order(created_at: :desc, votes_count: :desc) }
end
