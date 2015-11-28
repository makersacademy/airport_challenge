require 'airport'

describe Airport do

  describe '#landing' do
    it { is_expected.to respond_to(:landing).with(1).argument }

    it 'allows a plane to land' do
      plane = Plane.new
      plane.landed = true
      subject.landing(plane)
      expect(subject.plane).to eq plane
    end

    it 'confirms landing' do
      plane = Plane.new
      subject.landing(plane)
      expect(subject.plane.landed).to eq true
    end
  end

  describe '#take_off' do
    it { is_expected.to respond_to(:take_off).with(1).argument }

    it 'allows to take off a plane' do
      plane = Plane.new
      subject.landing(plane)
      plane.landed = true
      subject.take_off(plane)
      expect(subject.plane).to eq plane
    end

    it 'confirms take off' do
      plane = Plane.new
      subject.landing(plane)
      plane.landed = false
      subject.take_off(plane)
      expect(subject.plane.landed).to eq false
    end
  end

end
