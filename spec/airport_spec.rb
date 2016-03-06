require 'airport'
describe Airport do
  subject(:airport) { described_class.new }
  let(:plane) { double(:plane) }
  let(:weather) { double(:weather) }
  before(:each) do
    allow(subject.weather).to receive(:stormy?).and_return(false)
  end

  describe 'Capacity tests' do
    it 'Has a default capacity' do
      expect(airport.capacity).to eq Airport::DEFAULT_CAPACITY
    end

    it 'Default airport capacity can be overridden' do
      airport = described_class.new(1000)
      expect(airport.capacity).to eq 1000
    end
  end

  describe 'landing planes' do
    it 'instructs the plane to land' do
      allow(plane).to receive(:land)
      subject.land plane
    end

    it 'has the plane after it has landed' do
      allow(plane).to receive(:land)
      subject.land plane
      expect(subject.has_plane?(plane)).to be true
    end

    it 'confirms the plane has landed' do
      allow(plane).to receive(:land)
      expect(subject.land plane).to eq "#{plane} landed at #{subject}"
    end

    context 'when the airport is full' do
      it 'prevents landing' do
        subject = described_class.new(0)
        allow(plane).to receive(:land)
        message = 'Cannot land since airport is full'
        expect { subject.land plane }.to raise_error message
      end
    end

    context 'when the weather is stormy' do
      it 'prevents landing' do
        allow(subject.weather).to receive(:stormy?).and_return(true)
        allow(plane).to receive(:land)
        message = 'Unable to land due to stormy weather'
        expect { subject.land plane }.to raise_error message
      end
    end
  end

  describe 'planes taking off' do
    it 'instructs the plane to take off' do
      allow(plane).to receive(:land)
      subject.land plane
      expect(plane).to receive(:take_off)
      subject.take_off plane
    end

    it 'plane not in airport after taking off' do
      allow(plane).to receive(:land)
      subject.land plane
      allow(plane).to receive(:take_off)
      subject.take_off plane
      expect(subject.has_plane?(plane)).to be false
    end

    it 'confirms the plane has taken off' do
      allow(plane).to receive(:land)
      subject.land plane
      allow(plane).to receive(:take_off)
      confirmation = "#{plane} has departed from #{subject}"
      expect(subject.take_off plane).to eq confirmation
    end

    context 'when weather is stormy' do
      it 'prevents takeoff' do
        allow(plane).to receive(:land)
        subject.land plane
        allow(subject.weather).to receive(:stormy?).and_return(true)
        allow(plane).to receive(:take_off)
        message = 'Unable to take off due to stormy weather'
        expect { subject.take_off plane }.to raise_error message
      end
    end
  end
end
