class SignupSerializer < ActiveModel::Serializer
  attributes :id, :camper_id, :activity_id, :time

  has_one :activity
  has_one :camper
end
