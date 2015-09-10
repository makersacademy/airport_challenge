require 'airport'
require 'plane'

describe Airport do

  let(:plane) {Plane.new }
  let(:airport) { Airport.new { include Weather } }

  before(:each) do
    airport.stub(:stormy?) { false }
  end

  it 'instructs a plane to land' do
    expect(airport).to respond_to(:land).with(1).argument
  end

  it 'receives a plane' do
    airport.land plane
    expect(airport.landing_strip.count).to eq(1)
  end

  it 'instructs a plane to take off' do
    expect(airport).to respond_to(:take_off).with(1).argument
  end

  it 'releases a plane' do
    airport.take_off plane
    expect(airport.landing_strip.count).to eq(0)
  end

  context 'when airport is full' do
    it 'does not allow a plane to land' do
      airport.capacity.times { airport.land plane }
      expect{ airport.land plane }.to raise_error "Conditions are not right for landing"
    end
  end

  context 'when weather conditions are stormy' do
    it 'does not allow a plane to take off' do
      airport.land plane
      airport.stub(:stormy?) { true }
      airport.take_off(plane)
      expect(airport.landing_strip.count).to eq(1)
    end

    it 'does not allow a plane to land' do
      airport.stub(:stormy?) { true }
      expect{ airport.land plane }.to raise_error "Conditions are not right for landing"
    end
  end
end
