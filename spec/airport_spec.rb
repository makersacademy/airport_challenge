require 'airport'

describe Airport do

  it { is_expected.to respond_to(:land_plane).with(1).argument }

  it { is_expected.to respond_to(:take_off).with(1).argument }

  it 'has a default capacity' do
    expect(subject.capacity).to eq Airport::DEFAULT_CAPACITY
  end

  describe '#land_plane' do
    it 'denies permission to land when stormy' do
      allow(subject).to receive(:stormy?) { true }
      plane = double(:plane, at_airport?: false)
      expect { subject.land_plane(plane) }.to raise_error "It is too stormy to land!"
    end

    it 'lands a plane at the airport' do
      allow(subject).to receive(:stormy?) { false }
      plane = double(:plane, at_airport?: false, land: false)
      subject.land_plane(plane)
      expect(subject.airport).to include plane
    end

    it 'does not allow plane to land if the plane is already at the airport' do
      allow(subject).to receive(:stormy?) { false }
      plane = double(:plane, at_airport?: true, take_off: false, land: true)
      expect { subject.land_plane(plane) }.to raise_error "Plane already at the airport"
    end
  end

  describe '#take_off' do
    it 'denies permission to take off when stormy' do
      allow(subject).to receive(:stormy?) { true }
      plane = double(:plane, at_airport?: false)
      expect { subject.take_off(plane) }.to raise_error "It is too stormy to take_off!"
    end

    it 'does not allow take_off if the plane is not at the airport' do
      allow(subject).to receive(:stormy?) { false }
      plane = double(:plane, at_airport?: false)
      expect { subject.take_off(plane) }.to raise_error "Plane not at the airport"
    end
  end

  describe '#stormy?' do
    it 'should return true if rand_weather_condition is 2' do
      allow(subject).to receive(:rand_weather_condition) { 2 }
      expect(subject.stormy?).to eq true
    end

    it 'should return false if rand_weather_condition is 4' do
      allow(subject).to receive(:rand_weather_condition) { 4 }
      expect(subject.stormy?).to eq false
    end
  end

  describe '#initialize' do
    subject { Airport.new }
    let(:plane) { double(:plane, at_airport?: false, land: false) }
    it "has default capacity" do
      allow(subject).to receive(:stormy?) { false }
      described_class::DEFAULT_CAPACITY.times {
        subject.land_plane(plane)
      }
      expect { subject.land_plane double(:plane, at_airport?: false, land: false) }.to raise_error 'Airport full, cannot land!'
    end
  end

  describe '#initialize' do
    it 'has a variable capacity' do
      airport = Airport.new(30)
      allow(airport).to receive(:stormy?) { false }
      30.times { airport.land_plane double(:plane, at_airport?: false, land: false) }
      expect { airport.land_plane double(:plane, at_airport?: false, land: false) }.to raise_error 'Airport full, cannot land!'
    end
  end
end
