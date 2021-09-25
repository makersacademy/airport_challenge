require './services/air_traffic_control'
require './services/airport_management_service'
require './services/plane_management_service'
require './services/weather_service'
require './domain/airport'

plane_management_service = PlaneManagementService.new
airport_management_service = AirportManagementService.new
weather_service = WeatherService.new

$atc = AirTrafficControl.new(
  plane_management_service,
  airport_management_service,
  weather_service)

$plane1 = Aeroplane.new(:AAAA, "747")
$plane2 = Aeroplane.new(:BBBB, "747")
$plane3 = Aeroplane.new(:CCCC, "747")

$airport1 = Airport.new("Heathrow", :LHR)
$airport2 = Airport.new("Stansted", :STD)
$airport3 = Airport.new("JFK", :JFK)

$atc.add_plane($plane1)
$atc.add_plane($plane2)
$atc.add_plane($plane3)

$atc.add_airport($airport1)
$atc.add_airport($airport2)
$atc.add_airport($airport3)
