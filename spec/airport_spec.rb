require 'airport'

describe Airport do
  let (:stormy) { double :stormy}

    context 'planes & airports' do
      before 'create plane and airport' do
        @my_plane = Plane.new
        @my_airport = Airport.new
      end

      it 'airport gives plane permission to takeoff' do
        allow(@my_airport).to receive(:stormy).and_return(false)
        @my_airport.land(@my_plane)
        expect(@my_airport.takeoff(@my_plane)).to eq true
      end

      it 'airport gives plane permission to land' do
        my_array = []
        allow(subject).to receive(:stormy).and_return(false)
        expect(subject.land(@my_plane)).to eq (my_array << @my_plane)
      end

      it 'plane requests landing and controller returns full' do
        allow(@my_airport).to receive(:stormy).and_return(false)
        3.times {@my_airport.land(Plane.new)}
        expect {@my_airport.land(Plane.new)}.to raise_error 'the airport is full'
      end

      it 'airport wont allow plane to takeoff it is isnt at the specific airport' do
        my_airport1 = Airport.new
        allow(my_airport1).to receive(:stormy).and_return(false)
        allow(@my_airport).to receive(:stormy).and_return(false)
        @my_airport.land(@my_plane)
        expect { my_airport1.takeoff(@my_plane) }.to raise_error 'Plane not at this airport'
      end

      it 'removes airport id when taking off' do
        allow(@my_airport).to receive(:stormy).and_return(false)
        @my_airport.land(@my_plane)
        @my_airport.takeoff(@my_plane)

        expect(@my_plane.airport).to be nil

      end

      it 'on takeoff change flying status to true' do
        allow(@my_airport).to receive(:stormy).and_return(false)
        @my_airport.land(@my_plane)
        @my_airport.takeoff(@my_plane)

        expect(@my_plane.flying).to eq true
      end

      it 'when landing change flying? to false' do
        allow(@my_airport).to receive(:stormy).and_return(false)
        @my_airport.land(@my_plane)
        @my_airport.takeoff(@my_plane)
        @my_airport.land(@my_plane)

        expect(@my_plane.flying).to eq false
      end

      it 'checks flying? status is false before airport allows takeoff' do
      allow(@my_airport).to receive(:stormy).and_return(false)
        @my_airport.land(@my_plane)
        @my_plane.flying?(true)

        expect{@my_airport.takeoff(@my_plane)}.to raise_error 'Plane is already flying'
      end

      it 'checks when a plane takes off it is removed from the airport list' do
        allow(@my_airport).to receive(:stormy).and_return(false)
        @my_airport.land(@my_plane)
        @my_airport.takeoff(@my_plane)

        expect(@my_airport.planes).to eq []
      end

    end

        it 'there is a default airport capacity of 30 planes' do
          my_airport= Airport.new(30)
          expect(my_airport.capacity).to eq 30
        end

        it 'checks the airport can see if there is stormy weather' do
          allow(subject).to receive(:stormy).and_return(true)
          expect(subject.stormy).to be true
        end


end
