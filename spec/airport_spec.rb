require 'airport'
describe Airport do
  subject(:airport) { described_class.new }
  let(:plane) { double(:plane) }
  let(:weather) { double(:weather) }

  it 'has a default capacity' do
    expect(airport.capacity).to eq Airport::DEFAULT_CAPACITY
  end

  it 'default airport capacity can be overridden' do
    airport = described_class.new(1000)
    expect(airport.capacity).to eq 1000
  end

  describe 'landing planes' do
    it { is_expected.to respond_to(:land).with(1).argument }

    it 'instructs the plane to land' do
      allow(subject.weather).to receive(:stormy?).and_return(false)
      allow(plane).to receive(:land)
      subject.land plane
    end

    it 'has the plane after it has landed' do
      allow(subject.weather).to receive(:stormy?).and_return(false)
      allow(plane).to receive(:land)
      subject.land plane
      expect(subject.planes).to eq [plane]
    end
    it 'prevents landing when weather is stormy' do
      allow(subject.weather).to receive(:stormy?).and_return(true)
      allow(plane).to receive(:land)
      message = 'Unable to land due to stormy weather'
      expect { subject.land plane }.to raise_error message
    end

    it 'prevents landing when the airport is full' do
    end
  end

  describe 'planes taking off' do
    it { is_expected.to respond_to(:land) }

    it 'instructs the plane to take off' do
      allow(subject.weather).to receive(:stormy?).and_return(false)
      allow(plane).to receive(:land)
      subject.land plane
      expect(plane).to receive(:take_off)
      subject.take_off plane
    end

    it 'plane not in airport after taking off' do
      allow(subject.weather).to receive(:stormy?).and_return(false)
      allow(plane).to receive(:land)
      subject.land plane
      allow(plane).to receive(:take_off)
      subject.take_off plane
      expect(subject.planes).not_to include plane
    end

    it 'prevents takeoff when weather is stormy' do
      allow(subject.weather).to receive(:stormy?).and_return(false)
      allow(plane).to receive(:land)
      subject.land plane
      allow(subject.weather).to receive(:stormy?).and_return(true)
      allow(plane).to receive(:take_off)
      message = 'Unable to take off due to stormy weather'
      expect { subject.take_off plane }.to raise_error message
    end
  end
end
