require 'airport'

describe Airport do

  describe '#initialize' do
    it 'sets a default capacity for the airport' do
      expect(subject.CAPACITY).to eq 20
    end
  end

  describe '#landing' do
    it 'lands a plane into the airport' do
      plane = Plane.new
      allow(subject.weather).to receive(:stormy).and_return false
      expect(subject.land(plane)).to eq "#{plane} has landed"
    end

    it 'does not allow landing if hanger full' do
      allow(subject.weather).to receive(:stormy).and_return false
      subject.CAPACITY.times{ subject.land(Plane.new)}
      expect{subject.land(Plane.new)}.to raise_error "Hanger full, connot land"
    end

    it 'does not allow landing if stormy' do
      plane = Plane.new
      allow(subject.weather).to receive(:stormy).and_return true
      expect{subject.land(plane)}.to raise_error "Weather is stormy cannot land"
    end

    it 'does not allow landing if plane already landed' do
      plane = Plane.new
      allow(subject.weather).to receive(:stormy).and_return false
      subject.land(plane)
      expect{subject.land(plane)}.to raise_error "Plane already landed"
    end

  end

  describe '#takeoff' do
    it 'plane takesoff out the airport and confirms its out' do
      plane = Plane.new
      allow(subject.weather).to receive(:stormy).and_return false
      subject.land(plane)
      subject.takeoff(plane)
      expect(subject.planes).to eq []
    end

    it 'does not allow takeoff if stormy' do
      plane = Plane.new
      allow(subject.weather).to receive(:stormy).and_return true
      expect{subject.takeoff(plane)}.to raise_error "Weather is stormy cannot takeoff"
    end

    it 'does not allow takeoff if plane already takenoff' do
      plane = Plane.new
      allow(subject.weather).to receive(:stormy).and_return false
      subject.land(plane)
      subject.takeoff(plane)
      expect{subject.takeoff(plane)}.to raise_error "Plane already taken off"
    end
  end

  describe '#feature test' do

    it 'Allows a number of planes to land and take off' do
      allow(subject.weather).to receive(:stormy).and_return false
      5.times { subject.land(Plane.new) }
      3.times { subject.takeoff(subject.planes.last) }
      expect(subject.planes.length).to eql 2
    end
  end
end
