require 'airport'

describe Airport do 
    it 'should be an airport' do
        expect(subject).to be_an_instance_of(Airport)
    end

    it 'should instruct planes to land' do 
        plane = double(:plane)
        
        subject.land_plane(plane)

        expect(subject.planes.length).to be 1
    end

    it 'should instruct planes to take off' do 
        planes = [double(:plane, :flight_number => 1), double(:plane, :flight_number => 2), double(:plane, :flight_number => 3)]
        planes.each { |plane| subject.land_plane(plane) }

        expect(subject.planes.length).to be 3
        
        actual = subject.take_off(planes[1])

        expect(actual).to be planes[1]
        expect(actual.flight_number).to be 2
        expect(subject.planes.length).to be 2
    end
end