require "airport"

describe Airport do

    it "can change capacity" do
        airport = Airport.new(5)
        expect(airport.capacity).to eq(5)
    end

    it "has a default capacity of 10" do
        airport = Airport.new
        expect(airport.capacity).to eq(10)
    end

    # describe "#full?"
    #     it "can tell whether the airport is full" do
    #         plane = double()
    #     end
    # end
end