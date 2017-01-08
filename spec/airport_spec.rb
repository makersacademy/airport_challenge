require 'airport.rb'

context 'Instructing airport to land a plane' do
  describe Airport do
    it 'has a plane attribute' do
      expect(subject.respond_to?(:plane)).to eq true
    end

    it 'can be instructed to land' do
      expect(subject.respond_to?(:land)).to eq true
    end

    it 'lands a given plane' do
      plane = Plane.new
      subject.land(plane)
      expect(subject.plane).to eq plane
    end
  end
end

context 'Instructing airport to takeoff plane' do
  describe Airport do
    it 'can be instructed to takeoff' do
      expect(subject.respond_to?(:takeoff)).to eq true
    end

    it 'takes off a given plane' do
      plane = Plane.new
      subject.land(plane)
      subject.takeoff(plane)
      expect(subject.plane).not_to eq plane
    end
  end
end

context 'airport\'s weather' do
  describe Airport do
    it 'has weather attribute' do
      expect(subject.respond_to?(:weather)).to eq true
    end
    it 'has get_weather returning either sunny or stormy' do
      ok = (subject.get_weather=='sunny'||subject.get_weather=='stormy')
      expect(ok).to eq true
    end
    it 'has method stormy? returning true if stormy' do
      subject.weather= 'stormy'
      expect(subject.stormy?).to eq true
    end
    it 'has method stormy? returning false if not stormy' do
      subject.weather= 'sunny'
      expect(subject.stormy?).to eq false
    end
  end
end

context 'airport capacity' do
  describe Airport do
    it 'has capactiy attribute' do
      expect(subject.respond_to?(:capacity)).to eq true
    end
    it 'has DEFAULT_CAPACITY when not specified' do
      expect(subject.capacity).to eq Airport::DEFAULT_CAPACITY
    end
    it 'has method full?' do
      expect(subject.respond_to?(:full?)).to eq true
    end
    it 'says full when capacity full' do
      subject.land(Plane.new)
      expect(subject.full?).to eq true
    end
  end
end
