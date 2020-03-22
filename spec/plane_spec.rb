require 'plane'

describe Plane do

  describe 'sunny' do

    before do
      allow_any_instance_of(Weather).to receive_messages(stormy?: false)
    end

    context 'landing' do

      it 'status changed to landed on #land' do
        airport = Airport.new
        airport.land(subject)
        expect(subject.status).to eq :landed
      end

      it 'cannot #land if already landed' do
        plane = Plane.new
        airport = Airport.new
        airport.land(plane)
        expect { airport.land(plane) }.to raise_error 'Plane already landed'
      end

    end

    context 'take off' do

      it 'status changed to flying on #take_off' do
        airport = Airport.new
        airport.land(subject)
        airport.take_off(subject)
        expect(subject.status).to eq :flying
      end

    end
  end
end
