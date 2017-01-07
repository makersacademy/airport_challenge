require 'airport'

describe Airport do

  describe 'Landing Planes' do
    it 'responds to the method land' do
      expect(subject).to respond_to(:land).with(1).argument
    end

    it 'stores a plane in the airport when landing' do
      plane = subject.land(Plane.new)
      expect(plane).to eq(plane)
    end

    it 'plane has landed and responds to method landed?' do
      plane = subject.land(Plane.new)
      expect(plane).to be_landed
    end
  end

  describe 'Planes Taking Off' do
    it 'responds to the method take-off' do
      expect(subject).to respond_to(:take_off)
    end

    it 'returns plane when taking off' do
      plane = subject.land(Plane.new)
      expect(subject.take_off).to eq(plane)
    end

    it 'plane takes off and confirms it is no longer in the airport' do
      plane = subject.land(Plane.new)
      expect(subject.take_off).to be_taken_off
    end
  end

end
