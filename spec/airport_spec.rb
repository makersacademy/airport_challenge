require './lib/airport.rb'
describe Airport do
    it "If plane lands, Airport is full" do
    #   # what the outcome should be
      airport = Airport.new 
    #   # creating a new plane instance to 
       expect(airport).to respond_to(:full)
    end
end