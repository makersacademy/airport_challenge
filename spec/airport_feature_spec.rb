require 'airport'

feature 'Air Traffic Control' do
  scenario 'Instructs a plane to land' do
    given_there_is_an_airport
    and_a_plane
    i_instruct_the_plane_to_land_at(@airport)
    and_confirm_that_it_has_landed
    and_the_plane_location_is_set_to_arrival_airport
  end

  scenario 'Instructs a plane to take off' do
    given_there_is_an_airport
    and_a_plane
    and_the_destination_airport_exists
    i_instruct_a_plane_to_takeoff(@plane, @destination)
    and_the_plane_confirms_departure
    and_the_plane_location_is_on_air
  end

  def given_there_is_an_airport
    @airport = Airport.new
  end
  
  def and_a_plane
    @plane = Plane.new
  end

  def and_the_destination_airport_exists
    @destination = Airport.new
  end

  def i_instruct_the_plane_to_land_at(airport)
    @airport.land_plane(@plane)
  end


  def and_confirm_that_it_has_landed 
    expect(@plane.on_ground).to eq true
  end

  def and_the_plane_location_is_set_to_arrival_airport
    expect(@plane.location).to eq @airport
  end

  def i_instruct_a_plane_to_takeoff(plane, to_destination)
    @airport.takeoff_plane(@plane, @destination)
  end

  def and_the_plane_confirms_departure
    expect(@plane.on_ground).to eq false
  end

  def and_the_plane_location_is_on_air
    expect(@plane.location).to eq "air"
  end
end