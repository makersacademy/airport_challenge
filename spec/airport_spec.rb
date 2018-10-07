require "airport"

describe Airport do
  context('when the weather is sunny') do
    before(:each) do
      allow(subject).to receive(:stormy?).and_return(false)
    end
    describe 'check if sunny' do
      it 'weather is stormy = false' do
        expect(subject.stormy?).to eq false
      end
    end
    describe 'landing and take off in good weather' do

      it 'instructs a plane to land' do
        plane = Plane.new
        subject.land(plane)
        expect(plane.status?).to eq "land"
      end

      it "returns error if plane already landed" do
        plane = Plane.new
        subject.land(plane)
        expect { subject.land(plane) }.to raise_error(RuntimeError, "plane already landed")
      end

      it 'plane is added to planes array' do
        plane = Plane.new
        subject.land(plane)
        expect(subject.in_hangar(plane)).to eq true
      end

      it 'plane is set as landed' do
        plane = Plane.new
        subject.land(plane)
        expect(plane.status?).to eq "land"
      end

      it 'plane is in hangar at this airport' do
        plane = Plane.new
        subject.land(plane)
        expect(subject.in_hangar(plane)).to eq true
      end

      it 'instructs a plane to take off' do
        plane = Plane.new
        subject.land(plane)
        subject.takeoff(plane)
        expect(plane.status?).to eq "air"
      end

      it "returns error if plane already in the air" do
        plane = Plane.new
        expect { subject.takeoff(plane) }.to raise_error(RuntimeError, "plane already in air")
      end

      it "returns error if plane not at this airport" do
        airport2 = Airport.new
        plane = Plane.new(airport2)
        expect { subject.takeoff(plane) }.to raise_error(RuntimeError, "plane not at this airport")
      end

      it 'plane is set as taken off' do
        plane = Plane.new
        subject.land(plane)
        subject.takeoff(plane)
        expect(plane.status?).to eq "air"
      end

      it 'plane is no longer in planes array - in_hangar = false' do
        plane = Plane.new
        subject.land(plane)
        subject.takeoff(plane)
        expect(subject.in_hangar(plane)).to eq false
      end
    end
  end

  context('when the weather is stormy') do
    before(:each) do
      allow(subject).to receive(:stormy?).and_return(true)
    end

    describe 'check if stormy' do
      it 'weather is stormy = true' do
        expect(subject.stormy?).to eq true
      end
    end

    describe 'prevent landing and take off in bad weather' do
      it 'prevents takeoff if stormy' do
        plane = Plane.new
        expect { subject.takeoff(plane) }.to raise_error(RuntimeError, "takeoff not allowed")
      end

      it 'prevents landing if stormy' do
        plane = Plane.new
        expect { subject.land(plane) }.to raise_error(RuntimeError, "landing not allowed")
      end
    end
  end

  describe 'check_capacity' do
    it 'checks capacity of the airport to see if its the default, which is 10' do
      expect(subject.capacity?).to eq Airport::DEFAULT_CAPACITY
    end
  end

  describe 'full?' do

    it 'raises an error when full' do
      subject.update_weather("sunny")
      subject.capacity.times { subject.land(Plane.new) }
      expect { subject.land(Plane.new) }.to raise_error 'Airport full'
    end
  end

  describe 'override default capacity of airport' do

    it 'checks capacity of the airport to 2 when created' do
      airport = Airport.new(2)
      expect(airport.capacity?).to eq 2
    end
  end
  describe 'update_capacity' do
    it 'sets capacity of the airport' do
      expect(subject.update_capacity).to eq true
    end
  end

end
