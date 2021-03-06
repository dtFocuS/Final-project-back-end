class UserSerializer < ActiveModel::Serializer
  attributes :id, :first_name, :last_name, :username, :email, :image, :activities, :verified

  def activities
    ActiveModel::SerializableResource.new(object.activities,  each_serializer: ActivitySerializer)
  end

  
end
