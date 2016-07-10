require 'airport'

describe Airport do
  let(:plane) {double :plane}

  it {is_expected.to respond_to(:planes)}
  it {is_expected.to respond_to(:confirm_landing)}
  it {is_expected.to respond_to(:confirm_take_off)}
  it {is_expected.to respond_to(:bad_weather)}

  describe '#initialization' do
    it 'it sets to capacity to 50' do
      Airport.new 50
      expect(subject.capacity).to eq 50
    end

    it 'it sets to default capacity' do
      expect(subject.capacity).to eq Airport::DEFAULT_CAPACITY
    end
  end

  describe '#land' do
    it {is_expected.to respond_to(:land).with(1).argument}

    it 'prevents landing when weather is stormy' do
      allow(subject).to receive(:full?).and_return false
      allow(subject).to receive(:exists?).and_return false
      allow(subject).to receive(:bad_weather).and_return true
      expect{ subject.land(plane) }.to raise_error 'Stormy weather is affecting flight'
    end

    before do
      allow(plane).to receive(:landed)
      allow(subject).to receive(:bad_weather).and_return false
    end

    it 'raises an error when airport full' do
        allow(subject).to receive(:full?).and_return true
        expect{subject.land(plane)}.to raise_error 'Aiport is full'
    end

    it 'raises an error when plane has already landed' do
      allow(subject).to receive(:exists?).and_return true
      expect{subject.land(plane)}.to raise_error 'Plane has already landed'
    end

    it 'allows a plane to land at the airport' do
      subject.land(plane)
      expect(subject.planes).to eq [plane]
    end
  end

  describe '#take_off' do
    it {is_expected.to respond_to(:take_off).with(1).argument}

    it 'raises an error when airport is empty' do
      allow(subject).to receive(:empty?).and_return true
      expect{subject.take_off(plane)}.to raise_error 'Airport is empty'
    end

    it 'raises an error if given plane is not at the aiport' do
      allow(subject).to receive(:bad_weather).and_return false
      allow(subject).to receive(:exists?).and_return false
      allow(plane).to receive(:landed)
      subject.land(plane)
      allow(plane).to receive(:took_off)
      expect{subject.take_off(plane)}.to raise_error 'No such plane at this airport'
    end

    it 'prevents take off when weather is stormy' do
      allow(subject).to receive(:empty?).and_return false
      allow(subject).to receive(:exists?).and_return true
      allow(subject).to receive(:bad_weather).and_return true
      expect{subject.take_off(plane)}.to raise_error 'Stormy weather is affecting flight'
    end
  end

end
