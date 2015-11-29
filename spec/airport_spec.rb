require 'airport'

describe Airport do

  let (:plane) { double :plane, landed: false, in_flight: true}
  let (:plane_land) {double :plane, landed: true, in_flight: false}

  describe 'airport capacity' do
    it 'should have a default capacity of 10' do
      expect(subject.capacity).to eq Airport::STANDARD_CAPACITY
    end

    it 'should have a variable capacity' do
      airport = described_class.new(20)
      expect(airport.capacity).to eq 20
    end

    it 'should not let landing planes exceed airport capacity' do
      airport = described_class.new(0)
      allow(airport).to receive(:storm_forecast) {false}
      expect{airport.land_plane(:plane)}.to raise_error "The airport is full"
    end
  end

  describe '#land_plane' do
    it {is_expected.to respond_to(:land_plane).with(1).argument}

    it 'should place planes on the [runway] when landing' do
      allow(subject).to receive(:storm_forecast) {false}
      subject.land_plane(:plane)
      expect(subject.runway.include?(plane)).to eq true
    end

    it 'should not allow planes already on the [runway] to land again' do
      allow(subject).to receive(:storm_forecast) {false}
      subject.land_plane(:plane)
      expect{subject.land_plane(:plane)}.to raise_error "Plane already landed"
    end

    it 'should not land planes when stormy' do
      allow(subject).to receive(:storm_forecast) {true}
      expect{subject.land_plane(:plane)}.to raise_error "Too stormy to land"
    end
  end

  describe '#take_off' do
    it {is_expected.to respond_to(:take_off).with(1).argument}

    it 'should remove planes from the [runway] on #take_off' do
      plane = (:plane_land)
      subject.runway << plane
      allow(subject).to receive(:storm_forecast) {false}
      subject.take_off(plane)
      expect(subject.runway.include?(plane)).to eq false
    end

    it 'should only allow planes to take off if they are on the [runway]' do
      allow(subject).to receive(:storm_forecast) {false}
      expect{subject.take_off(:plane_land)}.to raise_error "Plane not in this airport"
    end

    it 'should not allow planes to fly when stormy' do
      allow(subject).to receive(:storm_forecast) {true}
      expect{subject.land_plane(:plane_land)}.to raise_error "Too stormy to land"
    end
  end

end
