require 'airport'
require 'plane'
describe Airport do 
subject(:airport) { described_class.new }

    it 'prevent landing when the airport is full' do  
        20.times do 
        airport = Airport.new
        plane = Plane.new
        expect{ airport.to respond_to(:full?).to raise_error 'landing not permitted: airport full'}
        end 
    end
    
    it "does not allow landing when weather is stormy" do 
        airport = Airport.new
        allow(airport).to receive(:stormy?).and_return true
        expect { airport.to respond_to(:landing).to raise_error 'plane cannot land: weather is stormy'}
    end
    
    it "does not allow takeoff when weather is stormy" do 
        airport = Airport.new 
        plane = Plane.new 
        allow(airport).to receive(:stormy?).and_return true
        expect { airport.to respond_to(:taking_off).to raise_error "Plane cannot takeoff: weather is stormy"}
    end
    
    it "Overides default airport capacity to 30" do
        default_airport = Airport.new
        expect(subject.capacity).to eq 30
        end
end





   

       

    
        



    



