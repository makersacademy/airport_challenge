require_relative 'domain/airport'
require_relative 'domain/aeroplane'
require_relative 'factory/aeroplane_factory'
require_relative 'services/weather_service'

$planes = []
25.times do
  $planes << AeroplaneFactory.build
end
puts 'added 5 planes'

weather_service = WeatherService.new
$jfk = Airport.new("JFK", weather_service, 10)
10.times {$jfk.land_plane(AeroplaneFactory.build)}
p "$jfk: capacity 10, current planes: 10"
$heathrow = Airport.new("Heathrow", weather_service)
p "$heathrow: capacity 20, current planes: 0"
$stansted = Airport.new("Stansted", weather_service)
p "$stansted: capacity 20, current planes: 0"