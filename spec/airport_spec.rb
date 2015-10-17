require 'airport'

describe Airport do


#subject(:airport){Airport.new}

  #context 'airport' do
    it 'Airport to land a plane' do
      plane = Plane.new
      expect(subject.land(plane)).to eq plane
    end

    # it 'plane can not land because the weather is stormy' do
    #   plane = Plane.new
    #   subject.land(plane)
    #   expect{subject.stormy).to raise_error('not possible to land because of the storm')
    # end

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

      it 'no land or take off if stormy' do
        plane = Plane.new
        expect{subject.land(plane, true)}.to raise_error
      end

    end
