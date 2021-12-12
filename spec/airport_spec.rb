require 'airport'

describe Airport do
    attr_reader :plane
    
    it 'responds to max capacity' do
        expect(subject).to respond_to :max_capacity
    end 
    it 'lands plane' do 
        plane = Plane.new
        expect(subject.land(plane)).to eq plane
    end 
    it 'takeoff plane' do
        plane = Plane.new
        subject.land(plane)
        expect(subject.takeoff(plane)).to eq plane
    end 
    describe '#take_off' do
        it 'raises error when there are no planes for takeoff' do
            expect { subject.takeoff(plane) }. to raise_error 'No planes for takeoff'
        end 
    end 

    describe '#fullairport' do
        it 'raises an error when full' do
            subject.land(Plane.new)
            expect { subject.land(plane) }. to raise_error 'Airport Full'
        end 
    end 
end 