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
      allow(plane).to receive(:land_plane)
      expect(subject.land(plane)).to include plane if !subject.stormy_weather?
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
      subject.take_off(plane)
      expect(planes).not_to include [plane]
    end

  end

  describe '#stormy_weather?' do
    it 'has a method that checks if the weather is stormy' do
      expect(subject).to respond_to(:stormy_weather?)
    end
  end

end
