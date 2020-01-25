require 'airport'

# my second test - checks if class exists
describe Airport do
    it 'checks if airport exists' do
        expect(subject).to be_a Airport
    end

# my third test - checks if the class Airport responds to the method land_plane
    it 'responds to land_plane' do
        expect(subject).to respond_to :land_plane
    end 
# one line syntax is it {is_expected.to respond_to :land_plane}
    it 'lands a plane' do 
        plane = Plane.new
        expect(subject.land_plane(plane)).to eq true
    end 

end
