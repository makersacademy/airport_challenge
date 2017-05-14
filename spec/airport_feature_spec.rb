require 'airport'

feature 'Air Traffic Controller' do

  # LANDING

  scenario 'Instructs a plane to land when it is not stormy' do
    given_there_is_an_airport
    and_a_plane
    and_weather_is_not_stormy
    i_instruct_the_plane_to_land_at_airport
    and_planes_confirms_that_it_has_landed
    and_the_plane_location_is_set_to_the_arrival_airport
  end

  scenario 'Instructs a plane to land when stormy' do
    given_there_is_an_airport
    and_a_plane
    and_weather_is_stormy
    i_instruct_the_plane_to_land_with_stormy_weather_at_airport
    and_expect_an_error
  end

  scenario 'After a plane landed the airport, it is added to the list of planes on ground at that airport' do
    given_there_is_an_airport
    and_a_plane
    and_weather_is_not_stormy
    i_instruct_the_plane_to_land_at_airport
    the_list_of_planes_on_ground_now_contains_the_plane_that_landed
  end

  scenario 'Instructs plane to land on a full airport' do
    given_there_is_an_airport
    and_a_plane
    and_weather_is_not_stormy
    i_instruct_the_plane_to_land_on_a_full_airport
    and_expect_an_error
  end

  # TAKEOFF

  scenario 'Instructs a plane to takeoff when stormy' do
    given_there_is_an_airport
    and_a_plane
    and_the_destination_airport_exists
    and_the_plane_is_in_the_airport
    and_weather_is_stormy
    i_instruct_a_plane_to_takeoff_with_stormy_weather_to_a_destination
    and_expect_an_error
  end

  scenario 'Instructs a plane to take off when its not stormy' do
    given_there_is_an_airport
    and_a_plane
    and_the_destination_airport_exists
    and_the_plane_is_in_the_airport
    and_weather_is_not_stormy
    i_instruct_a_plane_to_takeoff_to_a_destination
    and_the_plane_confirms_departure
    and_the_plane_location_is_on_air
  end

  
  # INSTRUCTIONS ########################

  # Create an Airport

  def given_there_is_an_airport
    @airport = Airport.new("LHR", 1)
  end
  
   # Create a Plane

  def and_a_plane
    @plane = Plane.new("G-ZBKP")
  end

  # Land the plane to make sure it on ground

  def and_the_plane_is_in_the_airport
    allow(@airport).to receive(:stormy?).and_return false
    @airport.land_plane(@plane)
  end

  # Set airport.stormy? to false

  def and_weather_is_not_stormy
    allow(@airport).to receive(:stormy?).and_return false
  end

  # Empty. Right now is just to make the story flow.. :)
  def and_expect_an_error
  end

  # Set weather to stormy
  def and_weather_is_stormy
    allow(@airport).to receive(:stormy?).and_return true
  end

  # Create a destination airport

  def and_the_destination_airport_exists
    @destination = Airport.new("LIS")
  end

  # LANDING INSTRUCTIONS ########################

  # Not stormy

  def i_instruct_the_plane_to_land_at_airport
    @airport.land_plane(@plane)
  end

  # Landing instructions to a full airport 

  def i_instruct_the_plane_to_land_on_a_full_airport
    allow(@airport).to receive(:stormy?).and_return false
    @airport.land_plane(@plane)
    expect { @airport.land_plane(@rejected_plane) }.to raise_error 'Operation aborted: Airport is full'
  end

  # Stormy

  def i_instruct_the_plane_to_land_with_stormy_weather_at_airport
    expect { @airport.land_plane(@plane) }.to raise_error 'Operation aborted: Weather is stormy'
  end

  # Plane confirms to be on ground after landing

  def and_planes_confirms_that_it_has_landed 
    expect(@plane.on_ground).to eq true
  end

  # Update plane location to the arrival airport

  def and_the_plane_location_is_set_to_the_arrival_airport
    expect(@plane.location).to eq @airport.iata_code
  end

  # Checks if the plane location is the arrival airport

  def the_list_of_planes_on_ground_now_contains_the_plane_that_landed
    expect(@airport.planes_on_ground).to eq ["G-ZBKP"]
  end

  # TAKEOFF INSTRUCTIONS ########################

  # Not stormy

  def i_instruct_a_plane_to_takeoff_to_a_destination
    @airport.takeoff_plane(@plane, @destination)
  end

  # Stormy

  def i_instruct_a_plane_to_takeoff_with_stormy_weather_to_a_destination
    expect { @airport.takeoff_plane(@plane, @destination) }.to raise_error 'Operation aborted: Weather is stormy'
  end

  # Confirmations

  def and_the_plane_confirms_departure
    expect(@plane.on_ground).to eq false
  end

  def and_the_plane_location_is_on_air
    expect(@plane.location).to eq "air"
  end 
  
end
