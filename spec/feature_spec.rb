require 'airport'
require 'plane'
require 'weather'
require 'spec_helper'

feature "controlling air traffic" do

  background do
    @sunny_weather = double(:weather, stormy?: false)
    @stormy_weather = double(:weather, stormy?: true)
    @planes = [
    Plane.new,
    Plane.new,
    Plane.new,
    Plane.new,
    Plane.new,
    ]
  end

  scenario 'planes take off from one airport and land at another' do
    Heathrow = Airport.new("Longford", 5, @sunny_weather)
    Gatwick = Airport.new("Crawley", 5, @sunny_weather)
    planes_at(Heathrow)
    all_take_off(Heathrow)
    expect_left(Heathrow)
    all_land(Gatwick)
    expect_at(Gatwick)
  end

  scenario "an airport doesn't accept planes when full" do
    London_City = Airport.new("Royal Docks", 2, @sunny_weather)
    London_Stanstead = Airport.new("Stanstead", 5, @sunny_weather)
    planes_at(London_Stanstead)
    all_take_off(London_Stanstead)
    expect { all_land(London_City) }.to raise_error("#{London_City.location} has no capacity")
  end

  def planes_at(airport)
    @planes.each do |plane|
      airport.add(plane)
      plane.arrive(airport.location)
    end
  end

  def all_take_off(airport)
    @planes.each do |plane|
      airport.take_off(plane)
    end
  end

  def all_land(airport)
    @planes.each do |plane|
      airport.land(plane)
    end
  end

  def expect_at(airport)
    expect(airport.send(:planes)).to eq @planes
  end

  def expect_left(airport)
    expect(airport.send(:planes)).to_not eq @planes
  end
end
