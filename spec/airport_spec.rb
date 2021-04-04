require 'airport'
describe Airport do
  describe '#land' do
    it 'prevents landing when airport is full' do
      allow(subject).to receive(:stormy?).and_return false
      Airport::DEFAULT_CAPACITY.times { subject.land Plane.new }
      expect { subject.land Plane.new }. to raise_error 'Airport full, do not land'
    end 
    it 'lands planes' do
      allow(subject).to receive(:stormy?).and_return false
      plane = Plane.new
      expect(subject.land(plane)).to eq [plane]
    end 
    it 'prevents landing when weather is stormy' do
      plane = Plane.new
      allow(subject).to receive(:stormy?).and_return true
      expect { subject.land(plane) }. to raise_error 'Stormy weather, do not land'
    end
  end 

  describe '#takeoff' do
    it 'allows planes to take off' do
      allow(subject).to receive(:stormy?).and_return false 
      plane = Plane.new
      subject.land(plane)
      expect(subject.takeoff(plane)).to eq plane
    end
    it 'prevents takeoff when weather is stormy' do
      plane = Plane.new
      allow(subject).to receive(:stormy?).and_return true
      expect { subject.takeoff(plane) }. to raise_error 'Stormy weather, do not take off'
    end
  end 

  describe '#plane_status' do
    it 'confirms the plane is no longer in the airport' do
      allow(subject).to receive(:stormy?).and_return false
      plane = Plane.new
      subject.land(plane)
      subject.takeoff(plane)
      expect(subject.plane_status(plane)).to be false
    end 

    it 'confirms the planes are in the airport' do
      allow(subject).to receive(:stormy?).and_return false
      plane = Plane.new
      subject.land(plane)
      expect(subject.plane_status(plane)).to be true
    end 
  end
end 
