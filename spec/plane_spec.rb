require 'plane'

RSpec.describe Plane do
  let(:airport) { double :airport }
  context 'As an air traffic controller 
           So I can get passengers to a destination 
           I want to instruct a plane to land at an airport' do
    it 'should land a plane' do
      expect(subject.land(airport)).to eq true
    end
  end
end
