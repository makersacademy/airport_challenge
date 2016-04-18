require 'airport'
require 'plane'

feature 'Feature Tests' do

  scenario 'Landing a flying plane at an airport' do
    land_plane_confirm_landed
  end

  scenario 'Plane takes off from airport & confirms leaving' do
    take_off_report_leaving
  end

  scenario 'Prevent take off in story weather' do
    no_take_off_if_stormy_weather
  end

  scenario 'Prevent landing in stormy weather' do
    no_landing_if_stormy_weather
  end

  scenario 'Prevent landing when airport is full' do
    no_landing_when_full_airport
  end

  scenario 'Override default capacity' do
    override_default_capacity
  end

  scenario 'Take off and land some planes' do
    take_off_and_land_planes
  end


  def land_plane_confirm_landed
    airport = Airport.new
    plane = Plane.new(airport)
    airport.update_weather until airport.update_weather == "sunny"
    plane.take_off(plane, airport)
    plane.land(plane, airport)
    plane.landed?
  end

  def take_off_report_leaving
    airport = Airport.new
    plane = Plane.new(airport)
    airport.update_weather until airport.update_weather == "sunny"
    airport.take_off(plane, airport)
    plane.current_airport
    plane.flying?
  end

  def no_take_off_if_stormy_weather
    message = "Can't take off in stormy weather"
    airport = Airport.new
    plane = Plane.new(airport)
    airport.update_weather until airport.update_weather == "stormy"
    expect { airport.take_off(plane, airport) }.to raise_exception message
  end

  def no_landing_if_stormy_weather
    message = "Can't land in stormy weather"
    airport = Airport.new
    plane = Plane.new(airport)
    airport.update_weather until airport.update_weather == "sunny"
    plane.take_off(plane, airport)
    airport.update_weather until airport.update_weather == "stormy"
    expect { airport.land(plane, airport) }.to raise_exception message
  end

  def no_landing_when_full_airport
    message = "Can't land in full airport"
    airport = Airport.new(0)
    plane = Plane.new(airport)
    airport.update_weather until airport.update_weather == "sunny"
    plane.take_off(plane, airport)
    expect { airport.land(plane, airport) }.to raise_exception message
  end

  def override_default_capacity
    airport = Airport.new
    airport.capacity = 3000
    expect(Airport::DEFAULT_CAPACITY).not_to eq(airport.capacity)
  end

    def take_off_and_land_planes
      airport = Airport.new
      destination = Airport.new
      plane1 = Plane.new(airport)
      plane2 = Plane.new(airport)
      plane3 = Plane.new(airport)
      plane4 = Plane.new(airport)
      plane5 = Plane.new(airport)

      airport.update_weather until airport.update_weather == "sunny"
      5.times do
      airport.take_off(airport.planes.last, airport)
      end

      destination.update_weather until destination.update_weather == "sunny"
      destination.land(plane1, destination)
      destination.update_weather until destination.update_weather == "sunny"
      destination.land(plane2, destination)
      destination.update_weather until destination.update_weather == "sunny"
      destination.land(plane3, destination)
    end

end
