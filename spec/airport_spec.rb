require 'airport'

describe Airport do

let(:plane) { double :plane }

  describe '#land' do

    it 'lands a plane at the airport' do
      expect(subject.land(plane)).to eq subject
    end

  end

  describe '#takeoff' do

    it 'makes a plane take off from the airport' do
      subject.land(plane)
      expect(subject.takeoff(plane)).to eq plane
    end

  end

  describe '#planes' do

    it 'has registered landed plane at airport' do
      subject.land(plane)
      expect(subject.planes).to eq [plane]
    end

    it 'confirms that plane is no longer at airport after takeoff' do
      subject.land(plane)
      subject.takeoff(plane)
      expect(subject.planes).not_to include plane
    end

  end


end
