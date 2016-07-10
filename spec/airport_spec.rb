require 'airport'

describe Airport do
  let(:plane) {double :plane}

  it {is_expected.to respond_to(:planes)}

  describe '#land' do
    it {is_expected.to respond_to(:land).with(1).argument}

    it 'allow a plane to land at the airport' do
      allow(subject).to receive(:bad_weather).and_return false
      allow(plane).to receive(:landed)
      subject.land(plane)
      expect(subject.planes).to eq [plane]
    end

    it 'prevents landing when weather is stormy' do
      allow(subject).to receive(:bad_weather).and_return true
      expect{subject.land(plane)}.to raise_error 'Cannot land due to stormy weather'
    end
  end

  describe '#take_off' do
    it {is_expected.to respond_to(:take_off).with(1).argument}

    it 'allows a plane to take off from the airport' do
      allow(subject).to receive(:bad_weather).and_return false
      allow(plane).to receive(:took_off)
      subject.take_off(plane)
      expect(subject.planes).to eq []
    end

    it 'prevents take off when weather is stormy' do
      allow(subject).to receive(:bad_weather).and_return true
      expect{subject.take_off(plane)}.to raise_error 'Cannot take off due to stormy weather'
    end
  end

end
