class ActivitySerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :user_id, :latitude, :longitude, :participations
end
