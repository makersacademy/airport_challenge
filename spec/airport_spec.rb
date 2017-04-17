require 'airport'

describe Airport do
  subject(:airport) {described_class.new}
  let(:plane) {double(:plane, is_a?: Plane)}
  let(:plane2) {double(:plane, is_a?: Plane)}

  before(:each) do
    allow(plane).to receive(:to_land)
    allow(plane).to receive(:take_off)
    allow(plane).to receive(:confirm)
  end

  describe '#initialize' do

    it 'initializes with a default capacity' do
      expect(subject.capacity).to eq(Airport::DEFAULT_CAPACITY)
    end

    it 'initializes with variable capacity' do
      airport = Airport.new 49
      expect(airport.capacity).to eq 49
    end

    it 'can only land num of planes equal to capacity' do
      allow(plane).to receive(:to_land)
      nr = rand(0..100)
      subject = Airport.new nr
      allow(subject.weather).to receive(:stormy?) {false}
      nr.times{subject.land(plane)}
      msg = 'Landing is not permitted as airport is full'
      expect{subject.land(plane)}.to raise_error msg
    end
  end

  context 'changing capacity' do
    it 'changing capacity can be done after initialization' do
        subject = Airport.new 30
        subject.change_capacity(50)
        expect(subject.capacity).to eq(50)
    end

    context 'egde cases' do
      it 'cannot change capacity if new capacity is lower than num of planes' do
        allow(plane).to receive(:to_land)
        subject = Airport.new 30
        allow(subject.weather).to receive(:stormy?) {false}
        30.times{subject.land(plane)}
        msg = 'Number of planes is higher than new capacity'
        expect{subject.change_capacity(20)}.to raise_error msg
      end
    end
  end

  context 'landing a plane' do
    before(:each) do
      allow(subject.weather).to receive(:stormy?) {false}
    end

    it 'instructs plane to land' do
      expect(plane).to respond_to(:to_land)
      subject.land(plane)
    end

    it 'lands a plane' do
      subject.land(plane)
      expect(subject.contains?(plane)).to be true
    end

    it 'confirms that plane is at airport' do
      subject.land(plane)
      expect(subject.contains?(plane)).to be true
    end

    it 'plane is prevented from landing in stormy weather' do
      allow(subject.weather).to receive(:stormy?) {true}
      msg = 'Landing is not allowed in stormy weather'
      expect{subject.land(plane)}.to raise_error msg
    end

    it 'cannot happen if airport is full' do
      Airport::DEFAULT_CAPACITY.times {subject.land(plane)}
      msg = 'Landing is not permitted as airport is full'
      expect{subject.land(plane)}.to raise_error msg
    end

    context 'edge cases' do
      it 'only planes can land in an airport' do
        fake_plane = 'Plane'
        allow(fake_plane).to receive(:to_land)
        msg = 'Only planes can land'
        expect{subject.land(fake_plane)}.to raise_error msg
      end

    end
  end

  context 'take-off' do
    before(:each) do
      allow(subject.weather).to receive(:stormy?) {false}
      subject.land(plane)
      allow(plane).to receive(:confirm)
    end

    it 'instructs plane to take_off' do
      expect(plane).to respond_to(:take_off)
      subject.take_off(plane)
    end

    it 'plane not at airport after takeoff' do
      subject.take_off(plane)
      expect(subject.contains?(plane)).to be false
    end

    it 'a specific plane takes-off' do
      allow(plane2).to receive(:to_land)
      allow(plane2).to receive(:confirm)
      subject.land(plane2)
      subject.take_off(plane)
      expect(subject.contains?(plane)).to be false
    end

    it 'confirmed that specific plane is not at airport' do
      allow(plane2).to receive(:to_land)
      allow(plane2).to receive(:confirm)
      subject.land(plane2)
      subject.take_off(plane)
      expect(subject.contains?(plane)).to be false
    end

    it 'plane is prevented from taking off in stormy weather' do
      allow(subject.weather).to receive(:stormy?) {true}
      msg = 'Take-off is not allowed in stormy weather'
      expect{subject.take_off(plane)}.to raise_error msg
    end

    context 'edge cases' do
      it 'cannot take of if not in that airport' do
        heath = Airport.new
        allow(heath.weather).to receive(:stormy?) {false}
        gat = Airport.new
        allow(gat.weather).to receive(:stormy?) {false}
        heath.land(plane)
        expect{gat.take_off(plane)}.to raise_error('Plane not at airport')
      end
    end
  end


end
