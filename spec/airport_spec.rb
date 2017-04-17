require './lib/airport'
require './lib/plane'
require './lib/weather'

describe Airport do
  it { is_expected.to be_instance_of(Airport) }
  it { is_expected.to respond_to(:land).with(1).argument }
  it { is_expected.to respond_to(:hangar) }
  it 'has a default capacity' do
    expect(subject.capacity).to eq Airport::DEFAULT_CAPACITY
  end
  it 'has a @capacity variable which can be customized upon instantiation of class' do
    subject = Airport.new(20)
    expect(subject.capacity).to eq 20
  end
  describe '#land' do
    it 'raises error if #land unavailable due to #weather_unsafe returning true' do
      allow(subject).to receive(:weather_unsafe?) { true }
      allow(subject).to receive(:hangar_full?) { false }
      expect { subject.land }.to raise_error 'Unable to land at airport'
    end
    it 'raises error if #land unavailable due to #hangar_full? returning true' do
      allow(subject).to receive(:weather_unsafe?) { false }
      allow(subject).to receive(:hangar_full?) { true }
      expect { subject.land }.to raise_error 'Unable to land at airport'
    end
    it 'lands plane and appends plane to @hangar array' do
      allow(subject).to receive(:weather_unsafe?) { false }
      allow(subject).to receive(:hangar_full?) { false }
      expect(subject.land).to eq 'Plane landed safely'
    end
    describe '#takeoff' do
      it 'plane takeoff succesful and removes instance of plane from @hangar array' do
        allow(subject).to receive(:weather_unsafe?) { false }
        allow(subject).to receive(:hangar_empty?) { false }
        expect(subject.takeoff).to eq 'Plane takeoff succesful'
      end
      it 'raises error if #takeoff unavailable due to #weather_unsafe returning true' do
        allow(subject).to receive(:weather_unsafe?) { true }
        allow(subject).to receive(:hangar_full?) { false }
        expect { subject.takeoff }.to raise_error 'Unable to takeoff from airport'
      end
      it 'raises error if #takeoff unavailable due to #hangar_empty? returning true' do
        allow(subject).to receive(:weather_unsafe?) { false }
        allow(subject).to receive(:hangar_full?) { true }
        expect { subject.takeoff }.to raise_error 'Unable to takeoff from airport'
      end
    end
  end
end
