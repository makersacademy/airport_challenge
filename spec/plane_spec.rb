require 'plane.rb'

describe Plane do
  let(:airport) { double :airport }

  describe '#land' do
    it 'the plane lands at the airport when clearance is granted' do
      allow(airport).to receive(:clear_to_land).and_return(true)
      expect(subject.land(airport)).to eq true
    end
  end

end
