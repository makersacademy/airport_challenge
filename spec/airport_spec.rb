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
      fk_weather = double(:report => :clear)
      fk_plane = double()
      fk_plane2 = double(:land => subject.park_plane(fk_plane))
      subject.land(fk_plane2, fk_weather)
      expect(subject.parked_planes[0]).to eq fk_plane
    end
    it "doesn't land a plane in stormy weather" do
      fk_weather = double(:report => :stormy)
      fk_plane = double()
      fk_plane2 = double(:land => subject.park_plane(fk_plane))
      expect {
        subject.land(fk_plane2, fk_weather)
      }.to raise_error 'Weather is too stormy to land!'
    end
    it "doesn't land a plane when the park is full" do
      fk_weather = double(:report => :clear)
      fk_plane = double()
      fk_plane2 = double(:land => subject.park_plane(fk_plane))
      fk_plane3 = double()
      5.times { subject.parked_planes.push(fk_plane3) }
      expect {
        subject.land(fk_plane2, fk_weather)
      }.to raise_error 'Airport cannot land any more planes at present!'
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
      fk_weather = double(:report => :clear)
      fk_plane = double()
      subject.parked_planes.push(fk_plane)
      fk_plane2 = double(:takeoff => subject.launch_plane(fk_plane))
      subject.takeoff(fk_plane2, fk_weather)
      expect(subject.parked_planes.include?(fk_plane)).to eq false
    end
    it "doesn't allow takeoff in stormy weather" do
      fk_weather = double(:report => :stormy)
      fk_plane = double()
      subject.parked_planes.push(fk_plane)
      fk_plane2 = double(:takeoff => subject.launch_plane(fk_plane))
      expect {
        subject.takeoff(fk_plane2, fk_weather)
      }.to raise_error 'Weather is too stormy to take off!'
    end
  end

  describe '#confirm_departure' do
    it 'confirms that a plane is no longer in the airport' do
      fk_weather = double(:report => :clear)
      fk_plane = double()
      subject.parked_planes.push(fk_plane)
      fk_plane2 = double(:takeoff => subject.launch_plane(fk_plane))
      subject.takeoff(fk_plane2, fk_weather)
      expect(subject.confirm_departure(fk_plane)).to eq true
    end
    it 'does not confirms that a plane is no longer in the airport if it actually still is' do
      fk_plane = double()
      subject.parked_planes.push(fk_plane)
      expect(subject.confirm_departure(fk_plane)).to eq false
    end
  end

  describe '#clear_weather?' do
    it 'returns true when weather is clear' do
      fk_weather = double(:report => :clear)
      expect(subject.clear_weather?(fk_weather)).to eq true
    end
    it 'returns false when weather is stormy' do
      fk_weather = double(:report => :stormy)
      expect(subject.clear_weather?(fk_weather)).to eq false
    end
  end

  describe '#full?' do
    it 'returns true when plane park is full' do
      fk_plane = double()
      5.times { subject.parked_planes.push(fk_plane) }
      expect(subject.full?).to eq true
    end
    it 'returns false when plane park is not full' do
      fk_plane = double()
      subject.parked_planes.push(fk_plane)
      expect(subject.full?).to eq false
    end
  end

  describe '#overide_capacity' do
    it 'allows a default capacity to be overidden' do
      subject.override_capacity(20)
      expect(subject.plane_capacity).to eq 20
    end
    it 'uses default values if not overidden' do
      expect(subject.plane_capacity).to eq 5
    end
  end
end
