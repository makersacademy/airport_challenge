require 'airport'
require 'plane'

context "Landing and taking off in bad weather" do
  specify "No planes can land or take off in bad weather" do
    given_an_airport_with_1_plane_landed_in_bad_weather
    when_another_plane_tries_to_land
    then_it_cant_and_stays_in_the_air

    when_the_first_plane_tries_to_take_off
    then_it_cant_and_stays_at_the_airport
  end

  def given_an_airport_with_1_plane_landed_in_bad_weather
    @weather = Weather.new
    allow(@weather).to receive(:stormy?).and_return(false)
    @airport = Airport.new "Prague", weather: @weather
    @plane = Plane.new
    @plane.land_at @airport
    allow(@weather).to receive(:stormy?).and_return(true)
  end

  def when_another_plane_tries_to_land
    @other_plane = Plane.new
    @other_plane.land_at @airport
  end

  def then_it_cant_and_stays_in_the_air
    expect(@other_plane.location).to eq Plane::FLYING
    expect(@airport.count).to eq 1
  end

  def when_the_first_plane_tries_to_take_off
    @plane.take_off
  end

  def then_it_cant_and_stays_at_the_airport
    expect(@plane.location).to eq "Prague"
    expect(@airport.count).to eq 1
  end
end
