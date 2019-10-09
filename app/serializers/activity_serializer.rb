class ActivitySerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :user_id, :latitude, :longitude, :address, :participations
end
