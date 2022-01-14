require 'airport'

describe Airport do
    attr_reader :plane

    it 'lands plane' do 
        plane = Plane.new
        expect(subject.land(plane)).to eq [plane]
    end 

    it 'takeoff plane' do
        plane = Plane.new
        subject.land(plane)
        expect(subject.takeoff(plane)).to eq plane
    end 

    describe '#take_off' do
        it 'raises error when there are no planes for takeoff' do
            expect { subject.takeoff(plane) }.to raise_error 'No planes for takeoff'
        end 
    end 
    
    #This test is being commented out - as this test is just to test that code works for 1 plane capacity. 

    #context '#fullairport' do
     #   it 'raises an error when full' do
      #      subject.land(Plane.new)
       #     expect { subject.land(plane) }.to raise_error 'Airport Full'
        #end 
    # end 

    describe 'when airport is at max capacity' do
        it 'raises an error when full' do
            Airport::DEFAULT_CAPACITY.times do
                subject.land Plane.new
            end
        end 
    end 
end 