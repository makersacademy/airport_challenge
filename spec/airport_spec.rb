require "airport"

describe Airport do
  
# As an air traffic controller 
# To ensure safety 
# I want to prevent landing when the airport is full 

  context "When hangar is not full"
  
  it "allows planes to land when hangar is not full" do
    san_jose = Airport.new
    san_jose.stormy = false
    jimbo = Plane.new(true)
    spruce_goose = Plane.new
    spruce_goose.land(san_jose)
    jimbo.land(san_jose)
    expect(san_jose.hangar.include? jimbo).to eq true
end

# As the system designer
# So that the software can be used for many different airports
# I would like a default airport capacity that can be overridden as appropriate

  context "When hangar is full"
  
  it "prevents planes from landing when hangar is full" do
    peninsula_de_osa = Airport.new(1)
    peninsula_de_osa.stormy = false
    jimbo = Plane.new(true)
    spruce_goose = Plane.new(true)
    spruce_goose.land(peninsula_de_osa)
    jimbo.land(peninsula_de_osa)
    expect(peninsula_de_osa.hangar.include? jimbo).to eq false
end
end