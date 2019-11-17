require 'airport'
require 'plane'

context "Testing airport capacity" do
  specify "Trying to land too many planes should keep planes in the air" do
    given_an_airport_at_full_capacity
    when_another_plane_tries_to_land
    then_it_should_not_be_successful_and_stay_in_the_air
  end

  specify "Airports can be created with custom capacity" do
    given_an_airport_with_capacity_of_30
    when_i_try_to_land_30_planes
    then_they_are_all_landed
    when_another_plane_tries_to_land
    then_it_should_not_be_successful_and_stay_in_the_air
  end

  def given_an_airport_at_full_capacity
    @weather = Weather.new
    allow(@weather).to receive(:stormy?).and_return(false)
    @airport = Airport.new "Birmingham", weather: @weather
    Airport::DEFAULT_CAPACITY.times { Plane.new.land_at @airport }
  end

  def when_another_plane_tries_to_land
    @other_plane = Plane.new
    @other_plane.land_at @airport
  end

  def then_it_should_not_be_successful_and_stay_in_the_air
    expect(@airport.count).to eq @airport.capacity
    expect(@other_plane.location).to eq Plane::FLYING
  end

  def given_an_airport_with_capacity_of_30
    @weather = Weather.new
    allow(@weather).to receive(:stormy?).and_return(false)
    @airport = Airport.new("Heathrow", capacity: 30, weather: @weather)
  end

  def when_i_try_to_land_30_planes
    @planes = Array.new(30) { Plane.new }
    @planes.each { |plane| plane.land_at @airport }
  end

  def then_they_are_all_landed
    expect(@airport.count).to eq 30
    @planes.each { |plane| expect(plane.location).to eq "Heathrow" }
  end
end
