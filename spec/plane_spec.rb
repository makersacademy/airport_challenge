require 'plane'

RSpec.describe Plane do
  subject(:plane) { Plane.new }
  let(:airport) { double :airport }
  context 'As an air traffic controller 
           So I can get passengers to a destination 
           I want to instruct a plane to land at an airport' do
    it 'should land a plane' do
      expect(plane.land(airport)).to eq true
    end
  end
end
