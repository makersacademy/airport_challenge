require 'plane.rb'

describe Plane do

   it "should show that plane responds to seat_passanger method" do
   expect(subject).to respond_to :seat_passanger
 end

  # it "should put a passanger into the plane" do
  #   passanger = Person.new
  #   expect(subject.seat_passangers(passanger)).to eq [passanger]
  #   end

end
