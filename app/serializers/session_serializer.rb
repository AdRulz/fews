class SessionSerializer < ActiveModel::Serializer
  attributes :user_id, :token

  def user_id
    object.id
  end
end
