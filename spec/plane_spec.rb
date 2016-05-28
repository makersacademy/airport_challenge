require 'plane'

describe Plane do
  it { is_expected.to respond_to(:take_off).with(0).argument }

  let(:lhw) { double(:lhw) } # London Heathrow LHW
  let(:plane) { Plane.new(lhw) }

  describe '#take_off' do
    it 'doesn\'t take off from airport if already airborne' do
      expect { subject.take_off }.to raise_error(RuntimeError, "Plane is already airborne.")
    end

    it 'leaves the airport' do
      expect(plane.take_off).to be_nil
    end
  end

  describe '#land' do
    it 'doesn\'t land at an airport if already on the ground' do
      expect { plane.land(lhw) }.to raise_error(RuntimeError, "Plane is already on the ground.")
    end

    it 'lands at an airport' do
      expect(subject.land(lhw)).to eq lhw
    end
  end
end
