require 'airport'

describe Airport do
  subject(:airport) { Airport.new }
  let(:plane) { double :plane }

  it { is_expected.to respond_to(:planes) }
  it { is_expected.to respond_to(:confirm_landing).with(1).argument }
  it { is_expected.to respond_to(:confirm_take_off).with(1).argument }
  it { is_expected.to respond_to(:bad_weather) }
  it { is_expected.to respond_to(:weather_check) }

  describe '#initialize' do

    it 'it sets the capacity to 20' do
      Airport.new 20
      expect(airport.capacity).to eq 20
    end

    it 'it sets the capacity to the default capacity' do
      expect(airport.capacity).to eq Airport::DEFAULT_CAPACITY
    end
  end

  describe '#land' do

    it { is_expected.to respond_to(:land).with(1).argument }

    it 'prevents landing when weather is stormy' do
      allow(airport).to receive(:full?).and_return false
      allow(airport).to receive(:exist?).and_return false
      allow(airport).to receive(:bad_weather).and_return true
      expect { airport.land(plane) }.to raise_error 'Bad weather is affecting this flight'
    end

    before do
      allow(plane).to receive(:landed)
      allow(airport).to receive(:bad_weather).and_return false
    end

    it 'raises an error when airport full' do
      allow(airport).to receive(:full?).and_return true
      expect { airport.land(plane) }.to raise_error 'Aiport is full'
    end

    it 'raises an error when plane has already landed' do
      allow(airport).to receive(:exist?).and_return true
      expect { airport.land(plane) }.to raise_error 'Plane has landed'
    end

    it 'allows a plane to land at the airport' do
      airport.land(plane)
      expect(airport.planes).to eq [plane]
    end
  end

  describe '#take_off' do

    it { is_expected.to respond_to(:take_off).with(1).argument }

    it 'raises an error when airport is empty' do
      allow(airport).to receive(:empty?).and_return true
      expect { airport.take_off(plane) }.to raise_error 'Airport is empty'
    end

    before do
      allow(airport).to receive(:bad_weather).and_return false
      allow(airport).to receive(:exist?).and_return false
      allow(plane).to receive(:landed)
      allow(plane).to receive(:took_off)
    end

    it 'raises an error if given plane is not at the airport' do
      allow(airport).to receive(:empty?).and_return false
      expect { airport.take_off(plane) }.to raise_error 'Plane not at the airport'
    end

    it 'prevents take off when weather is stormy' do
      allow(airport).to receive(:empty?).and_return false
      allow(airport).to receive(:exist?).and_return true
      allow(airport).to receive(:bad_weather).and_return true
      expect { airport.take_off(plane) }.to raise_error 'Bad weather is affecting this flight'
    end
  end

end
