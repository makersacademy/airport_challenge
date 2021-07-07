require 'airport'

describe Airport do
    it "(1.Airport)  To see if the plane has landed " do
        expect(subject).to respond_to(:land).with(1).argument
    end

    it "(2. Airport) take off from an airport" do 
        expect(subject).to respond_to(:take_off).with(1).argument
    end

    it "(3. Airport) Checks the airport if full" do
        expect { airport.land(:plane) }.to raise_error "Airport full can't land here" 
    end


    it "(4. Airport) raises an error when there are no planes available " do
        expect { airport.take_off(:plane) }.to raise_error 'No planes available'
    end

end
