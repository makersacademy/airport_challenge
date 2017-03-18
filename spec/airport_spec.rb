require 'airport'
describe Airport do
  let (:plane) {double :plane}
  let (:planes) {double :planes}
  let (:weather) {double :weather}

  describe '#land' do
    it 'has a method that lands planes' do
      expect(subject).to respond_to :land
    end

    it 'responds with one argument' do
      expect(subject).to respond_to(:land).with(1).argument
    end

    it 'lands planes in the Airport' do
      plane = double(:plane)
      allow(subject).to receive(:stormy_weather?).and_return(2)
      allow(plane).to receive(:land_plane)
      expect(subject.land(plane)).to include plane
    end

    it 'does not allow landing when weather is stormy' do
      plane = double(:plane)
      allow(subject).to receive(:stormy_weather?).and_return(9)
      allow(plane).to receive(:land_plane)
      expect{ subject.land(plane) }.to raise_error("Bad weather today. Cannot land.")
    end

    it 'does not allow landing when airport is full' do
      plane = double(:plane)
      allow(plane).to receive(:land_plane)
      20.times {subject.land(plane)}
      expect(subject.land(plane)).to raise_error("Sorry. Airport full. Go away.")
    end

  end

  describe '#take_off' do
    it 'has a method that lets planes take off' do
      expect(subject).to respond_to :take_off
    end

    it 'responds with one argument' do
      expect(subject).to respond_to(:take_off).with(1).argument
    end

    it 'allows planes to take off from Airport' do
      plane = double(:plane)
      planes = [plane]
      allow(subject).to receive(:stormy_weather?).and_return(2)
      allow(plane).to receive(:take_off_plane)
      subject.take_off(plane)
      expect(planes).not_to include [plane]
    end

    it 'does not allow take off when weather is stormy' do
      plane = double(:plane)
      allow(subject).to receive(:stormy_weather?).and_return(9)
      allow(plane).to receive(:take_off_plane)
      expect{ subject.take_off(plane) }.to raise_error("Bad weather today. Cannot take off.")
    end

  end

  describe '#stormy_weather?' do
    it 'has a method that checks if the weather is stormy' do
      expect(subject).to respond_to(:stormy_weather?)
    end
    it 'returns a number between 0 and 10' do
      expect(subject.stormy_weather?).to be_between(0, 10).inclusive
    end
  end

end
