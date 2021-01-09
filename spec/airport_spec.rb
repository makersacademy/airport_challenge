require 'airport'
require 'plane'
describe Airport do 
    subject(:airport) { described_class.new(20) }

    it 'prevent landing when the airport is full' do 
        20.times do 
            airport = Airport.new 
        expect{ airport.to respond_to(:full?).to raise_error 'landing not permitted: airport full'}
        end 
   end

   it "Overides default airport capacity to 30" do
    default_airport = Airport.new
    expect(subject.capacity).to eq 30
   end
end



   

       

    
        



    



