require 'airport'

airport = Airport.new
describe Airport do
    
    #Airport responds to .land method to 'hold' a plane
    it { is_expected.to respond_to(:land).with(1).argument} 
    
    it 'lands a plane' do
        plane = Plane.new
        airport.land(plane)
        expect(airport.plane).to eq(plane)
    end
    
    it { is_expected.to respond_to(:plane)}
    
    #Airport responds to .take_off method to release a plane.
    it { is_expected.to respond_to(:take_off)} 
    
    it 'allows plane to take_off' do
        plane = airport.take_off
        expect(plane).to be_airborne
    end 

end   

#Throw an error message when airport is full

# describe land do
 #   it 'raises an error when the airport is full'
#  airport.land(Plane.new)
# expect {airport.land (plane.new)}.to raise_error "The airport is full"
# end 
