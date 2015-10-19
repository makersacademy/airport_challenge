require 'airport'

describe Airport do

  context 'challenge 1-2' do
    it 'Airport to land a plane' do
      plane = double('plane', flying: true)
      expect(subject.land(plane)).to eq plane
    end
      it 'plane can take off the airport' do
        plane = double('plane', flying: false)
        subject.take_off plane
        expect(subject.planes).not_to include plane
      end
    end

  context 'challenge 3' do
      it 'not land if full' do
        plane = double('plane', flying: true)
        subject.capacity.times { subject.land(plane) }
        expect { subject.land(plane) }.to raise_error
      end
    end

  context 'challenge 4' do
      it 'planes cannot land if stormy' do
        stormy = double('stormy', stormy: true)
        expect{subject.land(plane)}.to raise_error
      end
      it 'planes cannot take_off if stormy' do
        stormy = double('stormy', stormy: true)
          expect{subject.take_off}.to raise_error
        end
      end

  context 'challenge 5' do
        it 'planes can only take off from the airport they are at' do
          plane = double('plane', flying: false)
          subject.take_off plane
          expect(subject.planes).not_to include plane

        end
      end

  context 'challenge 6' do
      it 'override airport capacity' do
        capacity = 20
        airport = Airport.new(capacity)
        expect(airport.capacity).to eq capacity
      end
    end

  context 'challenge 7' do
       it 'the plane cannot take off if flying' do
         plane = double('plane')
         expect{ subject.take_off(plane) }.to raise_error
       end
     end

  context 'challenge 8' do
    it 'plane cannot land if flying' do
      plane = double('plane')
      expect{subject.land plane}.to raise_error
    end
  end

  context 'challenge 9' do
       it 'the plane who took off is no longer in the airport' do
         plane = double('plane', flying: nil)
        #  subject.land plane
         subject.take_off plane
         expect(subject.planes).not_to include plane
       end
     end
end
