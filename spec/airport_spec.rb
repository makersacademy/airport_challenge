require "airport"
require "plane"
require "weather"

plane = Plane.new

describe Airport do

  it 'assigns default airport capacity' do
      expect(subject.capacity).to eq 200
  end

  describe '#land' do
    it { is_expected.to respond_to(:land).with(1).argument }

    it 'lets plane to land' do
      expect(subject.land(plane)).to eq plane
    end

    it 'raises an error when the capacity is full' do
      200.times { subject.land(plane) }
      expect { subject.land(plane) }.to raise_error 'No landing slots available!'
    end
  end

  describe '#take_off' do
    it { is_expected.to respond_to(:take_off) }

    it 'confirms that the plane is no longer in the airport' do
      expect(subject.planes).to be_empty
    end
  end
end
