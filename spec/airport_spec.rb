require 'airport'

describe Airport do

  let(:plane) {double(:plane, kind_of?: Plane)}
  let(:plane2) {double(:plane, kind_of?: Plane)}

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
      allow(subject).to receive(:stormy?) {false}
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
        allow(subject).to receive(:stormy?) {false}
        30.times{subject.land(plane)}
        msg = 'Number of planes is higher than new capacity'
        expect{subject.change_capacity(20)}.to raise_error msg
      end
    end
  end

  context 'landing a plane' do
    before (:each) do
      allow(plane).to receive(:to_land)
      allow(plane).to receive(:landed?)
      allow(subject).to receive(:stormy?) { false }
    end

    it 'instructs plane to land' do
      expect(plane).to respond_to(:to_land)
      subject.land(plane)
    end

    it 'lands a plane' do
      subject.land(plane)
      expect(subject.planes).to include plane
    end

    it 'confirms that plane is at airport' do
      subject.land(plane)
      expect(subject.contains?(plane)).to eq true
    end



    it 'plane is prevented from landing in stormy weather' do
      allow(subject).to receive(:stormy?) { true }
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
    before (:each) do
      allow(plane).to receive(:to_land)
      allow(plane).to receive(:take_off)
      allow(subject).to receive(:stormy?) {false}
      subject.land(plane)
    end

    it 'instructs plane to take_off' do
      expect(plane).to respond_to(:take_off)
      subject.take_off(plane)
    end

    it 'plane not at airport after takeoff' do
      subject.take_off(plane)
      expect(subject.planes).not_to include plane
    end

    it 'a specific plane takes-off' do
      allow(plane2).to receive(:to_land)
      allow(plane2).to receive(:landed?)
      subject.land(plane2)
      subject.take_off(plane)
      expect(subject.planes).not_to include plane
    end

    it 'confirmed that specific plane is not at airport' do
      allow(plane2).to receive(:to_land)
      subject.land(plane2)
      subject.take_off(plane)
      expect(subject.contains?(plane)).to eq false
    end

    it 'plane is prevented from taking off in stormy weather' do
      allow(subject).to receive(:stormy?) {true}
      expect{subject.take_off(plane)}.to raise_error('Take-off is not allowed in stormy weather')
    end

    context 'edge cases' do
      it 'cannot take of if not in that airport' do
        pending('edge')
        tbc
      end
    end
  end

  context 'weater' do
    it 'can be stormy' do
      test_result = false
      300.times do
        if subject.stormy?
          test_result = true
          break
        end
      end
      expect(test_result).to eq(true)
    end

    it 'can be not stormy' do
      test_result = false
      300.times do
        unless subject.stormy?
          test_result = true
          break
        end
      end
      expect(test_result).to eq(true)
    end
  end
end
