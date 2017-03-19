require 'airport'
describe Airport do
  let (:plane) {double :plane}
  let (:planes) {double :planes}
  let (:weather) {double :weather}

  describe '#land' do
    it 'has a method that lands planes' do
      expect(subject).to respond_to :land
    end

    it 'responds with two arguments' do
      expect(subject).to respond_to(:land).with(2).argument
    end

    it 'lands planes in the Airport' do
      plane = double(:plane)
      weather = double(:weather, stormy_weather?: false)
      allow(plane).to receive(:land_plane)
      expect(subject.land(plane, weather)).to include plane
    end

    it 'does not allow landing when weather is stormy' do
      plane = double(:plane)
      weather = double(:weather, stormy_weather?: true)
      allow(plane).to receive(:land_plane)
      expect{ subject.land(plane, weather) }.to raise_error("Bad weather today. Cannot land.")
    end

    it 'does not allow landing when airport is full' do
      plane = double(:plane)
      weather = double(:weather, stormy_weather?: false)
      allow(plane).to receive(:land_plane)
      subject.capacity.times {subject.land(plane, weather)}
      expect{subject.land(plane, weather)}.to raise_error("Sorry. Airport full. Go away.")
    end

  end

  describe '#take_off' do
    it 'has a method that lets planes take off' do
      expect(subject).to respond_to :take_off
    end

    it 'responds with two argument' do
      expect(subject).to respond_to(:take_off).with(2).argument
    end

    it 'allows planes to take off from Airport' do
      weather = double(:weather, stormy_weather?: false)
      plane = double(:plane)
      planes = [plane]
      allow(plane).to receive(:take_off_plane)
      subject.take_off(plane, weather)
      expect(planes).not_to include [plane]
    end

    it 'does not allow take off when weather is stormy' do
      plane = double(:plane)
      weather = double(:weather, stormy_weather?: true)
      expect{ subject.take_off(plane, weather) }.to raise_error("Bad weather today. Cannot take off.")
    end

  end

end
