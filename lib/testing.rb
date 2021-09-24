require_relative 'airport'
require_relative 'aeroplane'
require_relative 'factory/aeroplane_factory'
require_relative 'services/weather_service'

$planes = []
5.times do
  $planes << AeroplaneFactory.build
end
puts 'added 5 planes'
puts $planes

weather_service = WeatherService.new

$heathrow = Airport.new(weather_service)
$stansted = Airport.new(weather_service)
