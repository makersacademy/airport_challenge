require_relative 'domain/airport'
require_relative 'domain/aeroplane'
require_relative 'factory/aeroplane_factory'
require_relative 'factory/airport_factory'
require_relative 'services/weather_service'
require_relative 'services/air_traffic_control'

$weather_service = WeatherService.new
$jfk = Airport.new("JFK", 123, :JFK, $weather_service)
$heathrow = Airport.new("Heathrow", 234, :LHR, $weather_service)
$stansted = Airport.new("Stansted", 345, :STD, $weather_service)

$atc = AirTrafficControl.new

$atc.add_airport($jfk)
$atc.add_airport($heathrow)
$atc.add_airport($stansted)

25.times do
  $atc.add_plane(AeroplaneFactory.build)
end
