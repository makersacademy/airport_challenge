require 'airport'

describe Airport do

  describe '#land' do
    it { is_expected.to respond_to(:land).with(1).argument }

    it 'lands a plane at the airport' do
      plane = Plane.new
      expect(subject.land(plane)).to eq subject
    end

  end

  describe '#takeoff' do
    it { is_expected.to respond_to(:takeoff).with(1).argument }

    it 'makes a plane take off from the airport' do
      plane = Plane.new
      subject.land(plane)
      expect(subject.takeoff(plane)).to eq plane
    end

  end

  describe '#planes' do

    it 'has registered landed plane at airport' do
      plane = Plane.new
      subject.land(plane)
      expect(subject.planes).to eq [plane]
    end

    it 'confirms that plane is no longer at airport after takeoff' do
      plane = Plane.new
      subject.land(plane)
      subject.takeoff(plane)
      expect(subject.planes).not_to include plane
    end

  end


end
