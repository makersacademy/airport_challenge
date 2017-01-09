require 'airport.rb'

context 'Instructing airport to land a plane' do
  describe Airport do
    it 'lands a given plane' do
      plane = double(:plane)
      subject.land(plane)
      expect(subject.planes).to include plane
    end
  end
end

context 'Instructing airport to takeoff plane' do
  describe Airport do
    it 'takes off a given plane' do
      plane = double(:plane)
      subject.land(plane)
      subject.takeoff(plane)
      expect(subject.planes).not_to include plane
    end
  end
end

context 'airport\'s weather' do
  describe Airport do
    it 'has get_weather returning either sunny or stormy' do
      ok = (subject.weather==:sunny||subject.weather==:stormy)
      expect(ok).to eq true
    end
    it 'has method stormy? returning true if stormy' do
      subject.weather= :stormy
      expect(subject.stormy?).to eq true
    end
    it 'has method stormy? returning false if not stormy' do
      subject.weather= :sunny
      expect(subject.stormy?).to eq false
    end
  end
end

context 'airport capacity' do
  describe Airport do

    it 'has DEFAULT_CAPACITY when not specified' do
      expect(subject.capacity).to eq Airport::DEFAULT_CAPACITY
    end
    # it 'says full when capacity full' do
    #   subject.land(Plane.new)
    #   expect(subject.full?).to eq true
    # end
  end
end

context 'when asking if airport has a plane' do
  describe Airport do
    it 'can tell if it has a given plane' do
      plane = Plane.new
      subject.weather= :sunny
      Action.new.land(plane, subject)
      expect(subject.has_plane?(plane)).to eq true
    end
  end
end
