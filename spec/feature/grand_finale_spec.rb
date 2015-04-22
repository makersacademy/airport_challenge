require 'capybara/rspec'
require 'airport'
require 'plane'

feature 'Feature Tests' do

  let(:airport) { Airport.new }
  let(:plane) { Plane.new }

  scenario 'plane cannot land if airport is full (6 planes)' do
    allow(airport).to receive(:local_weather) { 'sunny' }
    6.times { airport.land Plane.new }
    expect { airport.land Plane.new }.to raise_error 'airport is full'
  end
  scenario 'airport can not issue take off requests if no airplanes' do
    allow(airport).to receive(:local_weather) { 'sunny' }
    expect { airport.take_off }.to raise_error 'airport is currently empty'
  end
  scenario 'Plane cannot take off or land if storm' do
    allow(airport).to receive(:local_weather) { 'sunny' }
    airport.land plane
    allow(airport).to receive(:local_weather) { 'stormy' }
    expect { airport.take_off }.to raise_error 'not now, storms brewing!'
    expect { airport.land Plane.new }.to raise_error 'not now, storms brewing!'
  end

  scenario 'Grand Finale' do
    planes = []
    6.times { planes << Plane.new }
    airport = Airport.new
    allow(airport).to receive(:local_weather) { 'sunny' }
    planes.each { |plane| airport.land plane }
    check_all_landed = planes.all? { |plane| plane.status == 'landed' }
    expect(check_all_landed).to eq true
    planes.each { |plane| airport.take_off plane }
    check_all_flying = planes.all? { |plane| plane.status == 'flying' }
    expect(check_all_flying).to be true
  end
end
