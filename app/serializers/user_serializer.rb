class UserSerializer < ActiveModel::Serializer
  attributes :id, :email
  has_many :articles, embed: :ids
end
