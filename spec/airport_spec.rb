require "airport"

describe Airport do
  
# As an air traffic controller 
# To ensure safety 
# I want to prevent landing when the airport is full 

  context "When hangar is full"
  
  it "prevents planes from landing when hangar is full" do
    san_jose = Airport.new
    jimbo = Plane.new
    spruce_goose = Plane.new
    spruce_goose.land(san_jose)
    jimbo.land(san_jose)
    expect(san_jose.hangar.include? jimbo).to eq false
end
end


# As the system designer
# So that the software can be used for many different airports
# I would like a default airport capacity that can be overridden as appropriate