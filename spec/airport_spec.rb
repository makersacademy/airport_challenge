require 'airport'

describe Airport do


#subject(:airport){Airport.new}

  #context 'airport' do
    it 'Airport to land a plane' do
      plane = Plane.new
      expect(subject.land(plane)).to eq plane
    end

      it 'plane can take off the airport' do
        plane = Plane.new
        subject.land(plane)
        expect(subject.take_off).to eq plane
      end


      it 'not land if full' do
        subject.capacity.times { subject.land(Plane.new) }
        expect { subject.land(Plane.new) }.to raise_error
      end

      it 'override airport capacity' do
        capacity = 20
        airport = Airport.new(capacity)
        expect(airport.capacity).to eq capacity
      end

      it 'planes cannot land if stormy' do
        plane = Plane.new
        subject.stormy?
        expect{subject.land(plane)}.to raise_error
      end

      it 'planes cannot take_off if stormy' do
          plane = Plane.new
          subject.stormy?
          expect{subject.take_off}.to raise_error
        end

       it 'the plane cannot take off if it\'s flying' do
         plane = Plane.new
         plane.flying?
         subject.take_off
         expect(subject).to raise_error
       end
    end
