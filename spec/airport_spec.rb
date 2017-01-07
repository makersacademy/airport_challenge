require "airport"
require "plane"
require "weather"

plane = Plane.new

describe Airport do
  describe '#land' do
    it { is_expected.to respond_to(:land).with(1).argument }

    it 'lets plane to land' do
      subject.land(plane)
      expect(subject.plane).to eq plane
    end

    it 'raises an error when the capacity is full' do
      subject.land(plane)
      expect { subject.land(plane) }.to raise_error 'No slots available'
    end
  end

  describe '#take_off' do
    it { is_expected.to respond_to(:take_off) }
  end
end
