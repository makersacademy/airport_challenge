require './lib/airport'
describe Airport do

 # I want it to respond to my method land plane  
    it 'responds to land plane ' do 
        airport= Airport.new
        expect(airport).to respond_to(:land_plane)
    end

    #I want land_plane to respond to 1 argument
    it { is_expected.to respond_to(:land_plane).with(1).argument }

    # I want it to land a plane
    it "lands a plane" do
       airplane = Airplane.new
        expect(airport.land_plane(airplane)).to eq(airplane)
    end

    # I want it to respond to my take_off method:
    it 'responds to take off ' do
        airport = Airport.new 
        expect(airport).to respond_to(:take_off)
       
    end
 # I want take_off to respond to 1 argument
    it { is_expected.to respond_to(:take_off).with(1).argument }
 
    
 


end