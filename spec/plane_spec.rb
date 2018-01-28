require 'plane'
require 'airport'

describe Plane do

  subject(:plane) {described_class.new}
  let(:airport) {Airport.new(weather)}
  let(:weather) {double stormy?: false}

  describe '#status' do

    before(:each) do
      airport.land(subject)
    end

    it 'states plane is in airport' do
      expect(subject.status).to eq :grounded
    end

    it 'states plane has left airport' do
      airport.takeoff(subject)
      expect(subject.status).to eq :airborne
    end

  end
end
