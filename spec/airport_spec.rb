require 'airport'
require 'plane'
require 'weather'

describe Airport do

    context 'when weather is clear' do
        let(:plane) {Plane.new}
        let(:weather) {Weather.new}

        it 'should land a plane in hangar' do
            allow(subject.weather).to receive(:bad?).and_return false 
            subject.land(plane)
            expect(subject.hangar.length).to eq(1)
        end

        it 'should tell plane to take off' do
            subject.hangar << "plane in hangar"
            allow(subject.weather).to receive(:bad?).and_return false
            subject.take_off
            expect(subject.hangar.length).to eq(0)
        end
        
        it 'should confirm a recently airborne plane is no longer at airport' do
            subject.hangar.push("plane1", "plane2")
            allow(subject.weather).to receive(:bad?).and_return false
            subject.take_off
            expect(subject.hangar).to_not include('plane2')
        end

    end


    context 'when weather is stormy' do
        let(:plane) {Plane.new}
        # let(:weather) {subject.weather}

        it 'should tell plane not to land ' do
            allow(subject.weather).to receive(:bad?).and_return true 
            expect{ subject.land(plane) }.to raise_error "Weather is bad, cannot land plane"
        end

        it 'should not tell a plane to take off' do
            allow(subject.weather).to receive(:bad?).and_return true 
            expect{ subject.take_off }.to raise_error "Weather is bad, plane cannot take off"
        end

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
            weather = Weather.new
            allow(subject.weather).to receive(:bad?).and_return false 

            subject.capacity = Airport::DEFAULT_CAPACITY
            Airport::DEFAULT_CAPACITY.times { subject.land(plane) }
            
            expect { subject.land(plane) }.to raise_error 'Airport is full'
        end

    end

end