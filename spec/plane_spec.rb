
# Looking back, tests could be a bit more comprehensive. Test where a plane is, if its in an airport or not etc.
#could also test if the airport array drops a plane during take_off
#Third thought, really could have added a fair amount more to this!

require 'plane'

describe Plane do
  subject(:plane) { described_class.new }
  let(:airport) { double :airport }

  describe '#take_off' do
    it { is_expected.to respond_to :take_off }

    it 'raises an error if already flying' do
      expect { plane.take_off }.to raise_error 'Plane cannot take off: plane already flying'
    end
  end

  describe '#land' do
    it 'raises an error if already landed' do
      plane.land(airport)
      expect { plane.land(airport) }.to raise_error 'Plane cannot land: plane already landed'
    end
  end

  describe '#airport' do
    it { is_expected.to respond_to :airport }

    it 'raises an error if already flying' do
      expect { plane.airport }.to raise_error 'Plane cannot be at an airport: plane already flying'
    end
  end
end

#with reference to https://github.com/sjmog/airport_challenge_exemplar/blob/master/spec/plane_spec.rb added more plane functionality
