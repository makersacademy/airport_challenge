require 'airport'

describe Airport do
  it { is_expected.to respond_to :land }
  it { is_expected.to respond_to :takeoff }
  it { is_expected.to respond_to :in_airport? }

  let(:plane) { Plane.new }

  describe '#land' do
    it 'should add plane to docked planes' do
      subject.land(plane)
      expect(subject.planes).to include plane
    end
  end

  describe '#takeoff' do
    it 'should remove plane from docked planes' do
      subject.land(plane)
      subject.takeoff(plane)
      expect(subject.planes).not_to include plane
    end
  end

  describe '#in_airport?' do
    it 'returns true when plane is docked' do
      subject.land(plane)
      expect(subject.in_airport?(plane)).to eq true
    end

    it 'returns false when plane is not in airport' do
      expect(subject.in_airport?(plane)).to eq false
    end
  end
end
