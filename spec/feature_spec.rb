RSpec::Expectations.configuration.on_potential_false_positives = :nothing

require 'spec_helper'
require 'airport'

describe "Working airport feature test" do
  it "landing and taking off some planes in sunny weather" do
    given_there_is_an_airport_with_capacity_3
    and_the_weather_is_always_sunny
    and_there_are_4_planes
    i_can_land_3_of_the_planes
    but_cannot_land_the_4th_one
    if_i_takeoff_one_plane_i_can_land_the_4th_one
    and_takeoff_all_of_the_grounded_planes_in_the_end
  end

  def given_there_is_an_airport_with_capacity_3
    @airport = Airport.new(3)
  end

  def and_the_weather_is_always_sunny
    allow(@airport).to receive(:stormy?) { false }
  end

  def and_there_are_4_planes
    @ba55 = Plane.new
    @ezy523 = Plane.new
    @su420 = Plane.new
    @nz33 = Plane.new
  end

  def i_can_land_3_of_the_planes
    @airport.land(@ba55)
    @airport.land(@su420)
    @airport.land(@nz33)
    expect(@airport.spaces).to include(@ba55, @su420, @nz33)
  end

  def but_cannot_land_the_4th_one
    expect { @airport.land(@ezy523) }.to raise_error("Airport full, landing denied.")
  end

  def if_i_takeoff_one_plane_i_can_land_the_4th_one
    @airport.takeoff(@nz33)
    expect { @airport.land(@ezy523) }.not_to raise_error("Airport full, landing denied.")
  end

  def and_takeoff_all_of_the_grounded_planes_in_the_end
    @airport.takeoff(@ezy523)
    @airport.takeoff(@ba55)
    @airport.takeoff(@su420)
    expect(@airport.spaces).to be_empty
  end
end
