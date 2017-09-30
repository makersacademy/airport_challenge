require './lib/plane'
require './lib/airport'
require './lib/weather'

describe 'Flights between airports' do
  it 'are possible' do
    heathrow = Airport.new 'Heathrow', 50
    jfk = Airport.new 'JFK', 40
    skye = Airport.new 'Ilse of Skye', 3

    first_plane = Plane.new
    heathrow.deliver_new_plane first_plane
    second_plane = Plane.new
    heathrow.deliver_new_plane second_plane
    third_plane = Plane.new
    heathrow.deliver_new_plane third_plane
    fourth_plane = Plane.new
    heathrow.deliver_new_plane fourth_plane

    weather = Weather.new
    while weather.stormy
      puts 'delay due to storms'
      weather = Weather.new
    end

    first_plane.take_off heathrow, weather
    puts "first plane in air", first_plane.airborne

    second_plane.take_off heathrow, weather
    puts "second plane in air", second_plane.airborne

    third_plane.take_off heathrow, weather
    puts "third plane in air", third_plane.airborne

    third_plane.land_at skye, weather
    p skye.parked_planes

    first_plane.land_at jfk, weather
    second_plane.land_at jfk, weather
    p jfk.parked_planes

    p heathrow.parked_planes

  end
end
