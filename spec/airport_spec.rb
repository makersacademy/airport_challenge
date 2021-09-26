require 'airport'
require 'plane'
require 'weather'

describe Airport do

    context 'when weather is clear' do
    
         it 'should land a plane in hangar' do
            plane = Plane.new
            weather = Weather.new
            allow(weather).to receive(:bad?).and_return(false) 
            expect(subject.land(plane)).to eq(["Plane"])
        end

        it 'should tell plane to take off' do
            plane = Plane.new
            subject.hangar << "plane ready to take off"
            subject.take_off
            expect(subject.hangar.length).to eq(0)
        end
        
        it 'should confirm a recently airborne plane is no longer at airport' do
            plane = Plane.new
            subject.hangar.push("plane1", "plane2")
            subject.take_off
            expect(subject.hangar).to_not include('plane2')
        end

    end


    context 'when weather is stormy' do

        it 'should be confirmed as bad weather' do
            plane = Plane.new
            weather = Weather.new
            allow(weather).to receive(:bad?).and_return(true) #stub
            expect(weather.bad?).to eq(true)
            puts weather.bad?
        end

        it 'should tell plane not to land ' do
            plane = Plane.new
            weather = Weather.new
            allow(weather).to receive(:bad?).and_return true 
            expect{ subject.land(plane) }.to raise_error "Weather is bad, cannot land plane"
        end

        it 'should not tell a plane to take off' 

    end

    context 'when system designing' do

        it 'should have a default capacity' do
            expect(subject.capacity).to eq Airport::DEFAULT_CAPACITY
        end

        it 'should override the default capacity' do
            subject.capacity = 250
            expect(subject.capacity).to_not eq Airport::DEFAULT_CAPACITY
        end
        
    end

    context 'when Airport is full' do

        it 'should not land a plane' do
            plane = Plane.new

            subject.capacity = Airport::DEFAULT_CAPACITY
            Airport::DEFAULT_CAPACITY.times { subject.land(plane) }

            expect { subject.land(plane) }.to raise_error 'Airport is full'
        end

    end

end