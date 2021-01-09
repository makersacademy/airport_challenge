require 'airport'
require 'plane'
describe Airport do 
    subject(:airport) { described_class.new(20) }

    it 'instructs a plane to land at airport' do 
        airport = Airport.new
    expect(airport).to respond_to(:land)
    end 

    it 'prevent landing when the airport is full' do 
        20.times do 
            airport = Airport.new 
        expect{ airport.to respond_to(:land).to raise_error 'landing not permitted: airport full'}
        end 
   end
end 
   

       

    
        



    



