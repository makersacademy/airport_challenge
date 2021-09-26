require './services/air_traffic_control'
require './services/airport_management_service'
require './services/plane_management_service'
require './services/weather_service'
require './domain/airport'
require './factory/airport_factory'
require './factory/aeroplane_factory'

plane_management_service = PlaneManagementService.new
airport_management_service = AirportManagementService.new
weather_service = WeatherService.new

$atc = AirTrafficControl.new(
  plane_management_service,
  airport_management_service,
  weather_service)

25.times { $atc.add_plane(AeroplaneFactory.build) }

$airport = AirportFactory.build

$atc.add_airport($airport)

20.times do
  plane = AeroplaneFactory.build
  $atc.add_plane(plane)
  $atc.clear_for_landing($airport.code, plane.id)
  $atc.land($airport.code, plane.id)
end

p $atc.find_airport_by_code($airport.code)
