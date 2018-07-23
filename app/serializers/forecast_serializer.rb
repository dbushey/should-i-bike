class ForecastSerializer < ActiveModel::Serializer
  attributes :latitude, :longitude, :hourly
end
