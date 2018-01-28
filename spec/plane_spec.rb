require 'plane'
require 'airport'

describe Plane do

  subject(:plane) {described_class.new}
  let(:airport) {Airport.new(weather)}
  let(:weather) {double :Weather, stormy?: false}

  describe '#status' do

    it 'shows \'grounded\' if plane has landed in airport' do
      airport.land(subject)
      expect(subject.status).to eq "Grounded"
    end

    it 'shows \'Airborne\' if plane has taken off from airport' do
      airport.takeoff(subject)
      expect(subject.status).to eq "Airborne"
    end
    
  end
end
