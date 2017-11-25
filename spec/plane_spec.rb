require 'airport'
require 'plane'

describe Plane do
  let(:airport) {double :airport}

  describe "#landed" do
    it 'has landed at the airport and should not be flying' do
      allow(airport).to receive(:land).and_return(subject.land)
      airport.land(subject)
      expect(subject.flying).to eq false
    end
  end

  describe "#taken off" do
    it 'has taken off and confirms that it is no longer in the airport' do
      allow(airport).to receive(:land).and_return(subject.land)
      allow(airport).to receive(:take_off).and_return(subject.take_off)
      airport.land(subject)
      airport.take_off(subject)
      expect(subject.flying).to eq true
    end
  end



end
