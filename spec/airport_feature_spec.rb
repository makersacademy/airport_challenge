require 'spec_helper'
require 'airport'
require 'plane'
require 'weather'

describe 'Airport', :type => :feature do

  scenario 'Land and take off several planes' do
    given_airports_and_planes
    given_good_weather
    when_those_planes_land
    the_right_planes_should_be_at_right_airports
    when_some_planes_takeoff
    the_right_planes_should_be_left_at_right_airports
    the_right_planes_should_be_in_the_air
  end

  def given_airports_and_planes
    @lax = Airport.new
    @ord = Airport.new
    @boeing777 = Plane.new
    @boeing747 = Plane.new
    @boeing767 = Plane.new
    @airbusA300 = Plane.new
    @airbusA310 = Plane.new
  end

  def given_good_weather
    allow(Weather).to receive(:stormy?) { false }
  end

  def when_those_planes_land
    @boeing777.land(@lax)
    @boeing747.land(@lax)
    @boeing767.land(@ord)
    @airbusA300.land(@lax)
    @airbusA310.land(@ord)
  end

  def the_right_planes_should_be_at_right_airports
    expect(@lax.planes).to eq([@boeing777, @boeing747, @airbusA300])
    expect(@ord.planes).to eq([@boeing767, @airbusA310])
  end

  def when_some_planes_takeoff
    @boeing777.takeoff
    @boeing767.takeoff
    @airbusA310.takeoff
  end

  def the_right_planes_should_be_left_at_right_airports
    expect(@lax.planes).to eq([@boeing747, @airbusA300])
    expect(@ord.planes).to be_empty
  end

  def the_right_planes_should_be_in_the_air
    expect(@boeing777.location).to eq("air")
    expect(@boeing767.location).to eq("air")
    expect(@airbusA310.location).to eq("air")
  end

end
