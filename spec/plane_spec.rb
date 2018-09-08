require 'plane'

RSpec.describe Plane do

  subject(:plane) { Plane.new(airport, weather) }
  let(:airport) { double :airport }
  let(:weather) { double :weather }

  context 'when the weather is sunny' do

    # As an air traffic controller 
    # So I can get passengers to a destination 
    # I want to instruct a plane to land at an airport
    it 'should land at an airport' do
      allow(weather).to receive(:forecast).and_return(:sunny)
      expect(plane.land(airport)).to eq true
    end

    # As an air traffic controller 
    # So I can get passengers on the way to their destination 
    # I want to instruct a plane to take off from an airport and confirm that it is no longer in the airport
    it 'should take off from an airport and return nil' do
      allow(weather).to receive(:forecast).and_return(:sunny)
      expect(plane.take_off).to eq nil
    end

  end

  context 'when weather is stormy' do

    # As an air traffic controller 
    # To ensure safety 
    # I want to prevent takeoff when weather is stormy 
    it 'should not take off from an airport' do
      allow(weather).to receive(:forecast).and_return(:stormy)
      expect { plane.take_off }.to raise_error('It is too stormy to take off')
    end

  end

end
