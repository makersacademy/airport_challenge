require './lib/passenger.rb'
describe Passenger do
    it "Say passengers have arrived" do
    #   # what the outcome should be
      passenger = Passenger.new 
    #   # creating a new plane instance to 
       expect(passenger).to respond_to(:arrived?)
     end

     it "Say passengers are leaving to their destination" do
      passenger = Passenger.new
      expect(passenger).to respond_to(:leaving?)
     end
  end