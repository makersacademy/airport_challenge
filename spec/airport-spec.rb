require "Airport"
test_airport = nil


describe "Airport" do
    test_airport = Airport.new
    it "will create an instance of Airport when run" do
        expect(test_airport.is_a? Object).to eq true
    end
end