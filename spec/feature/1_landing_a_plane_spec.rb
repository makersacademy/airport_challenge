require 'airport'
require 'plane'

context "Plane landing and take off" do
  specify "landing a plane at an airport" do
    given_an_airport_called_paris_and_a_plane
    when_the_plane_lands_at_paris
    then_the_planes_location_is_paris
    and_paris_has_one_plane
  end

  specify "landing and taking off again from an airport" do
    given_an_airport_called_paris_and_a_plane
    when_the_plane_lands_at_paris
    and_then_takes_off
    then_the_planes_location_is_in_the_air
    and_the_airport_no_longer_has_any_planes
  end

  def given_an_airport_called_paris_and_a_plane
    @weather = Weather.new
    allow(@weather).to receive(:stormy?).and_return(false)
    @paris = Airport.new "Paris", weather: @weather
    @plane = Plane.new
  end

  def when_the_plane_lands_at_paris
    @plane.land_at @paris
  end

  def then_the_planes_location_is_paris
    expect(@plane.location).to eq "Paris"
  end

  def and_paris_has_one_plane
    expect(@paris.count).to eq 1
  end

  def and_then_takes_off
    @plane.take_off
  end

  def then_the_planes_location_is_in_the_air
    expect(@plane.location).to eq Plane::FLYING
  end

  def and_the_airport_no_longer_has_any_planes
    expect(@paris.count).to eq 0
  end
end
