require 'plane'

describe Plane do
  let(:plane) { described_class.new }
  describe '#initialization' do
    it 'upon initialization a plane is flying' do
      expect(plane.in_flight).to eq true
    end
  end

  describe '#take_off' do
    it { is_expected.to respond_to(:take_off) }

    it 'plane already flying cannot take off' do
      expect { plane.take_off }.to raise_error "Unable to take off: plane already flying"
    end
  end

  describe '#land' do
    it { is_expected.to respond_to(:land) }

    it 'a plane that has landed cannot land again' do
      plane.land
      expect { plane.land }.to raise_error "Unable to land: plane already landed"
    end
  end
end
