require 'spec_helper'
require 'airport'

describe "Working airport" do
  it "landing and taking off some planes" do
    given_there_is_an_airport_with_capacity_3
    and_the_weather_is_always_sunny
    and_there_are_4_planes
    i_can_land_3_of_the_planes
    but_cannot_land_the_4th_one
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


end