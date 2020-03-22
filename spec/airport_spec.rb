require 'plane'
describe Plane do
it 'instructs a plane to land' do
    expect(subject).to respond_to :land_plane
end
    it 'instructs the plain to take off' do
        expect(subject).to respond_to :take_off
    end
    
    it 'lets you know when the plane is no longer present' do
        plane = Plane.new
        plane.take_off
        expect(plane::present).to eq false
    end

end