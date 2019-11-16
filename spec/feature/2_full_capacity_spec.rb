require 'airport'
require 'plane'

context "Testing airport capacity" do
  specify "Trying to land too many planes should keep planes in the air" do
    given_an_airport_at_full_capacity
    when_another_plane_tries_land
    then_it_should_not_be_successful_and_stay_in_the_air
  end

  def given_an_airport_at_full_capacity
    @airport = Airport.new "Birmingham"
    Airport::DEFAULT_CAPACITY.times { Plane.new.land_at @airport }
  end

  def when_another_plane_tries_land
    @other_plane = Plane.new
    @other_plane.land_at @airport
  end

  def then_it_should_not_be_successful_and_stay_in_the_air
    expect(@airport.count).to eq Airport::DEFAULT_CAPACITY
    expect(@other_plane.location).to eq Plane::FLYING_STRING
  end
end
