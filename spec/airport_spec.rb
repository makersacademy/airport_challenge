require 'airport'
require 'plane'
require 'weather'

describe Airport do
    
    context 'when weather is good' do
        before(:each) do
            @plane = Plane.new
            allow(subject.weather).to receive(:bad?).and_return false
        end
  
        it 'allows planes to land at an airport' do
          subject.land(@plane)
          expect(subject.airport.length).to eq(1)
        end
   
        it 'lets plane takeoff' do
          subject.airport << "Plane in airport"
          subject.takeoff
          expect(subject.airport.length).to eq(0)
        end
    end

    context 'When weather is bad' do
        before(:each) do
            @plane = Plane.new
            allow(subject.weather).to receive(:bad?).and_return true
        end 

        it 'does not land plane' do
            expect{ subject.land(@plane) }.to raise_error 'More Bad weather'
        end

        it 'plane does not take off' do
            expect{ subject.takeoff }.to raise_error 'Bad weather'
        end
    end

    context 'When Airport full' do
        it 'does not let plane land' do
            plane = Plane.new
            allow(subject.weather).to receive(:bad?).and_return false

            subject.capacity = Airport::DEFAULT_CAPACITY
            Airport::DEFAULT_CAPACITY.times { subject.land(plane) }

            expect { subject.land(plane) }.to raise_error 'Airport is full'
        end
    end

    context 'Capacity parameters' do
     
        it 'has default capacity' do
            expect(subject.capacity).to eq Airport::DEFAULT_CAPACITY
        end

        it 'Override capacity' do
            subject.capacity = 40
            expect(subject.capacity).to_not eq Airport::DEFAULT_CAPACITY
        end
    end
end