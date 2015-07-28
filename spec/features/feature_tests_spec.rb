require 'capybara/rspec'
require 'airport'
require 'plane'
require 'weather_generator'

feature 'Feature testing:' do
  scenario '--> new plane & airport created; land plane at airport' do
    gatwick=Airport.new
    airbus1=Plane.new
    allow(gatwick).to receive( :check_weather ) {"sunny"}
    gatwick.clear_to_land airbus1
    expect( gatwick.planes.length ).to be 1
  end

  scenario '--> plane takes off from airport' do
    gatwick=Airport.new
    airbus1=Plane.new
    allow(gatwick).to receive( :check_weather ) {"sunny"}
    gatwick.clear_to_land airbus1
    gatwick.clear_to_takeoff airbus1
    expect( gatwick.planes.length ).to be 0
  end

  scenario '--> unable to add more planes than capacity allows' do
    gatwick=Airport.new
    allow(gatwick).to receive( :check_weather ) {"sunny"}
    gatwick.capacity.times {gatwick.clear_to_land Plane.new}
    expect{ gatwick.clear_to_land Plane.new }.to raise_error "No space at airport"
  end

  scenario '--> unable to take off when stormy' do
    luton=Airport.new
    airbus=Plane.new
    allow(luton).to receive( :check_weather ) {"sunny"}
    luton.clear_to_land airbus
    allow(luton).to receive( :check_weather ) {"stormy"}
    expect{ luton.clear_to_takeoff airbus }.to raise_error "Can't take off in stormy weather"
  end

  scenario '--> unable to land when stormy' do
    luton=Airport.new
    airbus=Plane.new
    allow(luton).to receive( :check_weather ) {"stormy"}
    expect{ luton.clear_to_land airbus }.to raise_error "Can't land in stormy weather"
  end

  scenario '--> unable to take off from an airport not landed at' do
    luton=Airport.new
    heathrow=Airport.new
    airbus=Plane.new
    allow(luton).to receive( :check_weather ) {"sunny"}
    allow(heathrow).to receive( :check_weather ) {"sunny"}
    heathrow.clear_to_land airbus
    expect{ luton.clear_to_takeoff airbus }.to raise_error "No such plane in airport"
  end
end
