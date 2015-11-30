require 'airport'

describe Airport do

  let(:airport) {described_class.new}
  let(:plane) {Plane.new}

  describe 'airport capacity' do
    it 'should have a default capacity of 10' do
      expect(subject.capacity).to eq Airport::STANDARD_CAPACITY
    end

    it 'should have a variable capacity' do
      airport.capacity = 20
      expect(airport.capacity).to eq 20
    end

    it 'should not let landing planes exceed airport capacity' do
      allow(airport).to receive(:storm_forecast) {false}
      Airport::STANDARD_CAPACITY.times {airport.land_plane(Plane.new)}
      expect{airport.land_plane(plane)}.to raise_error "The airport is full"
    end
  end

  describe '#land_plane' do
    it {is_expected.to respond_to(:land_plane).with(1).argument}

    it 'should note that landed planes are landed' do
      allow(airport).to receive(:storm_forecast) {false}
      airport.land_plane(plane)
      expect(plane.landed).to eq true
    end

    it 'should place planes on the [runway] when landing' do
      allow(airport).to receive(:storm_forecast) {false}
      airport.land_plane(plane)
      expect(airport.runway.include?(plane)).to eq true
    end

    it 'should not allow planes already on the [runway] to land again' do
      allow(airport).to receive(:storm_forecast) {false}
      airport.land_plane(plane)
      expect{airport.land_plane(plane)}.to raise_error "Plane already landed"
    end

    it 'should not land planes when stormy' do
      allow(airport).to receive(:storm_forecast) {true}
      expect{airport.land_plane(plane)}.to raise_error "Too stormy to land"
    end
  end

  describe '#take_off' do
    it {is_expected.to respond_to(:take_off).with(1).argument}

    it 'should note that in-flight planes are not landed' do
      allow(airport).to receive(:storm_forecast) {false}
      airport.land_plane(plane)
      airport.take_off(plane)
      expect(plane.landed).to eq false
    end

    it 'should remove planes from the [runway] on #take_off' do
      allow(airport).to receive(:storm_forecast) {false}
      airport.land_plane(plane)
      airport.take_off(plane)
      expect(airport.runway.include?(plane)).to eq false
    end

    it 'should only allow planes to take off if they are on the [runway]' do
      allow(airport).to receive(:storm_forecast) {false}
      expect{airport.take_off(plane)}.to raise_error "Plane not in this airport"
    end

    it 'should not allow planes to fly when stormy' do
      allow(airport).to receive(:storm_forecast) {true}
      expect{airport.land_plane(plane)}.to raise_error "Too stormy to land"
    end
  end

  describe 'forecast' do
    it{is_expected.to respond_to(:storm_forecast)}
  end

end
