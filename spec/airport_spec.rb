require 'airport'

describe Airport do

  describe 'airport capacity' do
    it 'should have a default capacity of 10' do
      expect(subject.capacity).to eq Airport::STANDARD_CAPACITY
    end

    it 'should have a variable capacity' do
      airport = Airport.new(20)
      expect(airport.capacity).to eq 20
    end

    it 'should not let landing planes exceed airport capacity' do
      allow(subject).to receive(:storm_forecast) { false }
      Airport::STANDARD_CAPACITY.times {subject.land_plane(Plane.new)}
      expect{subject.land_plane(Plane.new)}.to raise_error "The airport is full"
    end
  end

  describe '#land_plane' do
    it {is_expected.to respond_to(:land_plane).with(1).argument}

    it 'should note that landed planes are landed' do
      plane = Plane.new
      allow(subject).to receive(:storm_forecast) { false }
      subject.land_plane(plane)
      expect(plane.landed).to eq true
    end

    it 'should place planes on the [runway] when landing' do
      plane = Plane.new
      allow(subject).to receive(:storm_forecast) { false }
      subject.land_plane(plane)
      expect(subject.runway.include?(plane)).to eq true
    end

    it 'should not allow planes already on the [runway] to land again' do
      plane = Plane.new
      allow(subject).to receive(:storm_forecast) { false }
      subject.land_plane(plane)
      expect{subject.land_plane(plane)}.to raise_error "Plane has already landed"
    end

    it 'should not land planes when stormy' do
      plane = Plane.new
      allow(subject).to receive(:storm_forecast) { true }
      expect{subject.land_plane(plane)}.to raise_error "Too stormy to land"
    end
  end

  describe '#take_off' do
    it { is_expected.to respond_to(:take_off).with(1).argument }

    it 'should note that in-flight planes are not landed' do
      plane = Plane.new
      allow(subject).to receive(:storm_forecast) { false }
      subject.land_plane(plane)
      subject.take_off(plane)
      expect(plane.landed).to eq false
    end

    it 'should remove planes from the [runway] on #take_off' do
      plane = Plane.new
      allow(subject).to receive(:storm_forecast) { false }
      subject.land_plane(plane)
      subject.take_off(plane)
      expect(subject.runway.include?(plane)).to eq false
    end

    it 'should only allow planes to take off if they are on the [runway]' do
      plane = Plane.new
      allow(subject).to receive(:storm_forecast) { false }
      expect{subject.take_off(plane)}.to raise_error "Plane is not in this airport"
    end

    it 'should not allow planes to fly when stormy' do
      plane = Plane.new
      allow(subject).to receive(:storm_forecast) { true }
      expect{subject.land_plane(plane)}.to raise_error "Too stormy to land"
    end
  end

  describe 'forecast' do
    it { is_expected.to respond_to(:storm_forecast) }
  end

end