class ArticleSerializer < ActiveModel::Serializer
  attributes :id, :title, :body, :email, :votes_count, :created_at

  def email
    object.user.email
  end
end
