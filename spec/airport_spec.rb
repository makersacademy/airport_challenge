require 'airport'

describe Airport do
  let(:plane) { Plane.new }

  describe '#land' do
    it 'lands a plane' do
      subject.land(plane)
      expect(subject.land(plane)[-1]).to eq plane
    end
  end

  describe '#takeoff' do
    it 'allows a plane to takeoff' do
      subject.land(plane)
      expect(subject.takeoff(plane)).to eq plane
    end
    it 'has planes flying after takeoff' do
      subject.land(plane)
      expect(subject.takeoff(plane).flying).to eq true
    end
  end

  describe '#at_airport?' do
    it 'says if plane is not in airport' do
      expect(subject.at_airport?(plane)).to eq false
    end
    it 'says if plane is in airport' do
      subject.land(plane)
      expect(subject.at_airport?(plane)).to eq true
    end
  end

end
