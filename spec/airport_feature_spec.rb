require 'spec_helper'
require 'airport'
require 'plane'
require 'weather'

describe 'Airport Feature', :type => :feature do

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
    @boeing_777 = Plane.new
    @boeing_747 = Plane.new
    @boeing_767 = Plane.new
    @airbus_a300 = Plane.new
    @airbus_a310 = Plane.new
  end

  def given_good_weather
    allow(Weather).to receive(:stormy?) { false }
  end

  def when_those_planes_land
    @boeing_777.land(@lax)
    @boeing_747.land(@lax)
    @boeing_767.land(@ord)
    @airbus_a300.land(@lax)
    @airbus_a310.land(@ord)
  end

  def the_right_planes_should_be_at_right_airports
    expect(@lax.planes).to eq([@boeing_777, @boeing_747, @airbus_a300])
    expect(@ord.planes).to eq([@boeing_767, @airbus_a310])
  end

  def when_some_planes_takeoff
    @boeing_777.takeoff
    @boeing_767.takeoff
    @airbus_a310.takeoff
  end

  def the_right_planes_should_be_left_at_right_airports
    expect(@lax.planes).to eq([@boeing_747, @airbus_a300])
    expect(@ord.planes).to be_empty
  end

  def the_right_planes_should_be_in_the_air
    expect(@boeing_777.location).to eq("air")
    expect(@boeing_767.location).to eq("air")
    expect(@airbus_a310.location).to eq("air")
  end

end
