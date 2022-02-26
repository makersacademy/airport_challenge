require 'airport'

describe Airport do
  describe ".land" do
    it "expects a plane to land at the airport" do
      destination = Airport.new
      expect(destination.land("BA101")).to eq "landed"
    end

  end

  describe ".take_off" do
    it "expects the plane to take off from the airport" do
      departure = Airport.new
      expect(departure.take_off("BA101")).to eq "took off"
    end

  end

end
  
#   describe "land" do  
#     it "plane lands" do
#       expect(subject).to respond_to(:land)
#     end

#     it "return the landed planes" do
#       p1 = Destination.new 
#       expect(p1.land).to eq p1
#     end

#   end

#   describe '.full?' do
#     it "prevents a plane from landing if airp[ort is full" do
#       expect(subject.full?).to eq "airport full"
#     end

#   end

# end

# require 'departure'

# describe Departure do
  
#   describe ".take off" do
#     it "responds to take off" do
#     expect(subject).to respond_to :take_off
#     end
  
#     it "removes the plane that took off" do
#       expect(subject.take_off).to eq "no longer at the airport"
#     end

#   end

# end