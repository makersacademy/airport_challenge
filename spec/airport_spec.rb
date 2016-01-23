require 'airport'

describe Airport do
  it { is_expected.to respond_to(:land).with(1).argument }
  it { is_expected.to respond_to(:takeoff).with(1).argument }

  describe '#land' do
    it 'lands plane' do
      plane = Plane.new
      expect(subject.land(plane)).to eq plane
    end

    it 'returns landed planes' do
      plane = Plane.new
      subject.land(plane)
      expect(subject.planes).to eq [plane]
    end

    it 'raises an error when airport is full' do
      20.times { subject.land(Plane.new) }
      expect { subject.land(Plane.new) }.to raise_error 'Airport is full!'
    end

    it 'raises an error when plane has already arrived' do
      plane = Plane.new
      subject.land(plane)
      expect { subject.land(plane) }.to raise_error 'Plane has already arrived.'
    end
  end

  describe '#takeoff' do
    it 'takeoffs plane' do
      plane = Plane.new
      subject.land(plane)
      expect(subject.takeoff(plane)).to eq plane
    end

    it 'removes plane from airport' do
      plane = Plane.new
      subject.land(plane)
      subject.takeoff(plane)
      expect(subject.planes).to eq []
    end

    it 'raises an error when plane is not at airport' do
      plane = Plane.new
      expect { subject.takeoff(plane) }.to raise_error 'Plane is not at this airport.'
    end

  end
end