require 'airport'

describe Airport do

  describe '#park_plane' do

    it 'parks a plane' do
      fk_plane = double()
      subject.park_plane(fk_plane)
      expect(subject.parked_planes[0]).to eq fk_plane
    end

  end

  describe '#land' do
    it 'tells a plane to land and parks it' do
      fk_plane = double()
      fk_plane2 = double(:land => subject.park_plane(fk_plane))
      subject.land(fk_plane2)
      expect(subject.parked_planes[0]).to eq fk_plane
    end
  end

  describe '#find_plane' do
    it 'returns index of parked plane' do
      fk_plane = double()
      fk_plane2 = double()
      subject.parked_planes.push(fk_plane)
      subject.parked_planes.push(fk_plane2)
      expect(subject.find_plane(fk_plane)).to eq 0
    end
  end

  describe '#launch_plane' do
    it 'launches a plane' do
      fk_plane = double()
      subject.park_plane(fk_plane)
      subject.launch_plane(fk_plane)
      expect(subject.parked_planes.include?(fk_plane)).to eq false
    end
  end

  describe '#takeoff' do
    it 'tells a plane to takeoff and launches it' do
      fk_plane = double()
      subject.parked_planes.push(fk_plane)
      fk_plane2 = double(:takeoff => subject.launch_plane(fk_plane))
      subject.takeoff(fk_plane2)
      expect(subject.parked_planes.include?(fk_plane)).to eq false
    end
  end

  describe '#confirm_departure' do
    it 'confirms that a plane is no longer in the airport' do
      fk_plane = double()
      subject.parked_planes.push(fk_plane)
      fk_plane2 = double(:takeoff => subject.launch_plane(fk_plane))
      subject.takeoff(fk_plane2)
      expect(subject.confirm_departure(fk_plane)).to eq true
    end
    it 'does not confirms that a plane is no longer in the airport if it actually still is' do
      fk_plane = double()
      subject.parked_planes.push(fk_plane)
      expect(subject.confirm_departure(fk_plane)).to eq false
    end
  end

end
