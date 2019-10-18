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
end