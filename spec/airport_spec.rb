require 'airport'

describe Airport do
    airport = Airport.new(20)
    let(:plane) { double :plane} # ❗️

describe '#land' do 
    # ------ First User Story Test------------------
    # I want to instruct a plane to land at an airport
    it 'instructs a plane to land' do
        expect(airport).to respond_to(:land).with(1).argument
    end
    # ------Third User Story Test------------------ 
    # I want to prevent landing when the airport is full
    context 'when the airport is full' do 
        it 'raises an error' do 
            20.times do
                airport.land(plane)
            end
            expect {airport.land(plane)}.to raise_error "Airport full!"
        end
    end
   
end
describe '#take_off' do
    # ------Second User Story Test------------------ 
    #  I want to instruct a plane to take off from an airport ⛔️ and confirm that it is no longer in the airport

    it 'instruct a plane to take off' do 
        expect(airport).to respond_to(:take_off).with(1).argument
    end 
 end
     
end