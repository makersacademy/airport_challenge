require 'airport'

airport = Airport.new
describe Airport do
    
    #Airport responds to .land method to 'hold' a plane
    #it 'lands a plane' 
    #plane = Plane.new
    #it { is_expected.to respond_to :land } 
    #expect(airport.plane).to eq(plane)
    
    #Airport responds to .take_off method to release a plane.
    it { is_expected.to respond_to :take_off } 
    
    it 'allows planes to take_off' do
        plane = airport.take_off
        expect(plane).to be_airborne
    end 

end   