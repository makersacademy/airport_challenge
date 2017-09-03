require 'airport'

feature 'Air Traffic Control' do

  scenario 'Instructs a plane to land when stormy' do
    given_there_is_an_airport
    and_a_plane
    and_weather_is_stormy
    i_instruct_the_plane_to_land_with_stormy_weather_at(@airport)
    and_expect_an_error
  end

  scenario 'Instructs a plane to land when its not stormy' do
    given_there_is_an_airport
    and_a_plane
    and_weather_is_not_stormy
    i_instruct_the_plane_to_land_at(@airport)
    and_confirm_that_it_has_landed
    and_the_plane_location_is_set_to_arrival_airport
  end

  scenario 'Instructs a plane to take off when stormy' do
    given_there_is_an_airport
    and_a_plane
    and_weather_is_stormy
    i_instruct_a_plane_to_takeoff_with_stormy_weather_at(@plane, @destination)
    and_expect_an_error
  end

  scenario 'Instructs a plane to take off when it is not stormy' do
    given_there_is_an_airport
    and_a_plane
    and_the_destination_airport_exists
    and_weather_is_not_stormy
    i_instruct_a_plane_to_takeoff_to(@plane, @destination)
    and_the_plane_confirms_departure
    and_the_plane_location_is_on_air
  end

  scenario 'After a plane landed at the airport, it is added to the list of planes on the ground at that airport'
    given_there_is_an_airport
    and_a_plane
    and_weather_is_not_stormy
    i_instruct_the_plane_to_land_at(@airport)
    the_list_of_planes_on_ground_now_countains_the_plane_that_landed
  end

  def given_there_is_an_airport
    @airport = Airport.new("LGW")
  end

  def and_a_plane
    @plane = Plane.new("G-ZKIH")
  end

  def and_weather_is_not_stormy
    allow(@airport).to receive(:stormy?).and_return false
  end

  def and_expect_an_error
  end

  def and_weather_is_stormy
    allow(@airport).to receive(:stormy?).and_return true
  end

  def and_the_destination_airport_exists
    @destination = Airport.new("FLR")
  end

  def i_instruct_the_plane_to_land_at(airport)
    @airport.land_plane(@plane)
  end

  def i_instruct_the_plane_to_land_with_stormy_weather_at(airport)
    expect { @airport.land_plane(@plane) }.to raise_error 'Operation aborted: Weather is stormy'
  end

  def i_instruct_plane_to_takeoff_with_stormy_weather_at(plane, airport)
    expect { @airport.takeoff_plane(@plane, @destination) }.to raise_error 'Operation aborted: Weather is stormy'
  end

  def and_confirm_that_it_has_landed
    expect(@plane.on_ground).to eq true
  end

  def and_the_plane_location_is_set_to_arrival_airport
    expect(@plane.location).to eq @airport.iata_code
  end

  def the_list_of_planes_on_ground_now_contains_the_plane_that_landed
    expect(@airport.planes_on_ground).to eq ["G-ZKIH"]
  end

  def i_instruct_a_plane_to_takeoff_to(plane, to_destination)
    @airport.takeoff_plane(@plane, @destination)
  end

  def and_the_plane_confirms_departure
    expect(@plane.on_ground).to eq false
  end

  def and_the_plane_location_is_on_air
    expect(@plane.location).to eq "air"
  end

end
