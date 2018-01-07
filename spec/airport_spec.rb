require './lib/airport.rb'
require './lib/plane.rb'
require './lib/weather.rb'

describe Airport do
  let(:airport) { Airport.new }
  let(:plane) { Plane.new }
  let(:default_airport) { Airport.new }

  it 'instruct a plane to land at an airport' do
    airport.land(plane)
    expect(airport).to respond_to(:land).with(1).argument
  end

  it 'adding plane into the storage' do
    airport.land(plane)
    expect(airport.show_planes).to include(plane)
  end

  it 'instructs a plane to take off from an airport' do
    airport.take_off(plane)
    expect(airport).to respond_to(:take_off).with(1).argument
  end

  it 'removing plane from the storage' do
    airport.take_off(plane)
    expect(airport.take_off(plane)).to eq nil
  end

  it 'taking off not allowed if it\'s stormy' do
    allow(airport).to receive(:check_stormy).and_return(false)
    airport.take_off(plane)
    allow(airport).to receive(:check_stormy).and_return(true)
    expect { airport.take_off(plane) }.to raise_error("Storm, wait until it's clear!")
  end

  it 'landing not allowed if it\'s stormy' do
    allow(airport).to receive(:check_stormy).and_return(false)
    airport.land(plane)
    allow(airport).to receive(:check_stormy).and_return(true)
    expect { airport.land(plane) }.to raise_error("Storm, wait until it's clear!!")
  end

  it 'doesn\'t allow to land if airport is full' do
    allow(airport).to receive(:full?).and_return(false)
    airport.land(plane)
    allow(airport).to receive(:full?).and_return(true)
    expect { airport.land(plane) }.to raise_error("The airport is full!")
  end

  it 'allows a default capacity to be overridden' do
    default_airport = Airport.new
    allow(default_airport).to receive(:check_stormy).and_return(false)
    allow(airport).to receive(:full?).and_return(true)
    Airport::DEFAULT_CAPACITY.times { default_airport.land(Plane.new) }
    expect { default_airport.land(Plane.new) }.to raise "Airport capacity reached!"
  end
  
end
