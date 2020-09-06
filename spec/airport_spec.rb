require 'airport_class'
require 'plane_class'
require 'number_module'

describe Airport do
#tests for setting up airport
  describe 'Airport initialize' do

    it 'initialises Aiport with array to store planes' do
      expect(subject.hangar).to be_an_instance_of(Array)
    end

    it 'initialises Airport with custom capacity' do
      airport = Airport.new(10)
      expect(airport.capacity).to eq 10
    end

    it 'initialises Airport with DEFAULT_CAPACITY' do
      airport = Airport.new
      expect(airport.capacity).to eq Airport:: DEFAULT_CAPACITY
    end

  end

#tests for taking off from airport in normal and storm weather conditions
  describe 'take-off' do

      context 'normal weather conditions ' do

        before(:each) do
          allow(subject).to receive(:storm?).and_return(false)
        end

        it 'allows planes to depart airport' do
          expect(subject).to respond_to(:take_off)
        end

        it 'confirms plane has departed airport' do
         plane = Plane.new
         subject.land(plane)
         subject.take_off(plane)
         expect(subject.at_airport?(plane)).to eq false
        end

        it 'raises error if plane tries to take-off from airport at which it has not landed' do
          airport = Airport.new
          plane = Plane.new
          expect { subject.take_off(plane)}.to raise_error("Plane is not present in hangar at this airport")
        end
    end

    context 'storm conditions' do

        it 'prevents plane taking off if weather is stormy' do
          plane = Plane.new
          allow(subject).to receive(:storm?).and_return(true)
          expect { subject.take_off(plane) }.to raise_error("Take off prohibited in stormy conditions.")
        end

      end
  end

#tests for landing at airport in normal and storm weather conditions

  describe 'landing' do

    context 'normal weather conditions' do

      before(:each) do
        allow(subject).to receive(:storm?).and_return(false)
      end

      it 'allows plane to land at airport' do
        expect(subject).to respond_to :land
      end

      it 'airport responds to full?' do
        expect(subject.full?).to eq false
      end

      it 'prevents plane landing if airport hangar is at capacity' do
        5.times { subject.land(Plane.new) }
        expect { subject.land(Plane.new) }.to raise_error("Landing prohibited. Airport hangar is at capacity.")
      end

      it 'prevents plane landing at airport if it has already landed there' do
        plane = Plane.new
        subject.land(plane)
        expect { subject.land(plane) }.to raise_error("Plane has already landed at this airport")
      end

    end

    context 'storm conditions' do

      it 'prevent plane landing in stormy coniditions' do
        plane = Plane.new
        allow(subject).to receive(:storm?).and_return(true)
        expect { subject.land(plane) }.to raise_error "Landing prohibited in stormy conditions."
      end

    end

  end

end
