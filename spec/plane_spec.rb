require 'plane'

describe Plane do

# As an air traffic controller
# So I can get passengers to a destination
# I want to instruct a plane to land at an airport

  context "When in the air"

    it "lands at airport" do
      jimbo = Plane.new(true)
      san_jose = Airport.new
      san_jose.stormy = false
      jimbo.land(san_jose)
      expect(san_jose.hangar).to include jimbo
    end

# As an air traffic controller 
# To ensure safety 
# I want to prevent landing when weather is stormy 

    it "will not land if stormy" do
      jimbo = Plane.new(true)
      san_jose = Airport.new
      san_jose.stormy = true
      jimbo.land(san_jose)
      expect(san_jose.hangar.include? jimbo).to eq false
    end
    
    it "cannot take off if flying" do
      jimbo = Plane.new(true)
      san_jose = Airport.new
      san_jose.stormy = false
      expect(jimbo.take_off(san_jose)).to eq "Already in flight"
    end

# As an air traffic controller 
# So I can get passengers on the way to their destination 
# I want to instruct a plane to take off from an airport and confirm that it is no longer in the airport

  context "When grounded"
  
    it "takes off from airport" do
      jimbo = Plane.new
      san_jose = Airport.new
      san_jose.stormy = false
      jimbo.land(san_jose)
      jimbo.take_off(san_jose)
      expect(san_jose.hangar.include? jimbo).to eq false
    end
    
    it "confirms" do
      jimbo = Plane.new
      san_jose = Airport.new
      san_jose.stormy = false
      jimbo.land(san_jose)
      jimbo.take_off(san_jose)
      expect(jimbo.confirm(san_jose)).to eq "Take off successful"
    end
    
# As an air traffic controller 
# To ensure safety 
# I want to prevent takeoff when weather is stormy 

    it "will not take off if stormy" do
      jimbo = Plane.new(true)
      san_jose = Airport.new
      san_jose.stormy = false
      jimbo.land(san_jose)
      san_jose.stormy = true
      jimbo.take_off(san_jose)
      expect(san_jose.hangar.include? jimbo).to eq true
    end
    
    it "cannot land if on ground" do
      jimbo = Plane.new
      san_jose = Airport.new
      san_jose.stormy = false
      expect(jimbo.land(san_jose)).to eq "Already landed"
    end
    
    it "can only take off from airport it is in" do
      jimbo = Plane.new(true)
      san_jose = Airport.new
      peninsula_de_osa = Airport.new
      san_jose.stormy = false
      peninsula_de_osa.stormy = false
      jimbo.land(san_jose)
      expect(jimbo.take_off(peninsula_de_osa)).to eq "Plane not in hangar"
    end
end