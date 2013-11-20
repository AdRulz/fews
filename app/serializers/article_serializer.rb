class ArticleSerializer < ActiveModel::Serializer
  attributes :id, :title, :body, :votes_count, :created_at, :author

  def author
    { id: object.user.id, email: object.user.email } if object.user
  end
end
