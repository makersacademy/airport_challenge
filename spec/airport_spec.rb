require 'airport'
describe Airport do
  subject(:airport) { described_class.new }
  let(:plane) { double(:plane, land: true, take_off: true) }
  let(:weather) { double(:weather) }

  describe 'Capacity tests' do
    it 'Has a default capacity' do
      expect(airport.capacity).to eq Airport::DEFAULT_CAPACITY
    end

    it 'Default airport capacity can be overridden' do
      airport = described_class.new(1000)
      expect(airport.capacity).to eq 1000
    end
  end

  before(:each) do
    allow(subject.weather).to receive(:stormy?).and_return(false)
  end

  describe '#landing' do
    it 'instructs the plane to land' do
      expect(plane).to receive(:land)
      subject.land plane
    end

    context 'after landing is authorized' do
      it 'plane is in the airport' do
        subject.land plane
        expect(subject.has_plane?(plane)).to be true
      end

      it 'confirms the plane has landed' do
        expect(subject.land(plane)).to eq "#{plane} landed at #{subject}"
      end
    end

    context 'when the airport is full' do
      it 'prevents landing' do
        subject = described_class.new(0)
        message = 'Cannot land since airport is full'
        expect { subject.land plane }.to raise_error message
      end
    end

    context 'when the weather is stormy' do
      it 'prevents landing' do
        allow(subject.weather).to receive(:stormy?).and_return(true)
        message = 'Unable to land due to stormy weather'
        expect { subject.land plane }.to raise_error message
      end
    end
  end

  describe '#take_off' do
  before(:each) { subject.land plane }

    it 'instructs the plane to take off' do
      expect(plane).to receive(:take_off)
      subject.take_off plane
    end

    context 'when plane has already taken off' do
      it 'tells the pilot he is drunk' do
        subject.take_off plane
        expect(subject.has_plane?(plane)).to be false
      end
    end

    context 'after take off is authorized' do
      it 'confirms the plane has taken off' do
        confirmation = "#{plane} has departed from #{subject}"
        expect(subject.take_off(plane)).to eq confirmation
      end
    end

    context 'when weather is stormy' do
      it 'prevents takeoff' do
        allow(subject.weather).to receive(:stormy?).and_return(true)
        message = 'Unable to take off due to stormy weather'
        expect { subject.take_off plane }.to raise_error message
      end
    end
  end
end
