require 'plane'

RSpec.describe Plane do
  subject(:plane) { Plane.new }
  let(:airport) { double :airport }

  context 'when the weather is sunny' do
    # As an air traffic controller 
    # So I can get passengers to a destination 
    # I want to instruct a plane to land at an airport
    it 'should land at an airport' do
      expect(plane.land(airport)).to eq true
    end
    # As an air traffic controller 
    # So I can get passengers on the way to their destination 
    # I want to instruct a plane to take off from an airport and confirm that it is no longer in the airport
    it 'should take off from an airport and return nil' do
      expect(plane.take_off).to eq nil
    end
  end
end
