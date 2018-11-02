require 'plane'

describe Plane do

  let(:airport) { double(:airport) }

  describe '#land' do

    it { expect(subject).to respond_to(:land) }

    it 'plane can land at an airport' do
      allow(airport).to receive(:hangar) { [] }
      expect(subject.land(airport)).to be_a_kind_of Array
    end

    it 'plane cannot land if already at an airport' do
      allow(airport).to receive(:hangar) { [] }
      subject.land(airport)
      expect { subject.land(airport) }.to raise_error 'Plane has already landed'
    end

  end

end
