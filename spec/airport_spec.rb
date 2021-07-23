require_relative  "../airport.rb"
require_relative  "../plane.rb"


describe Airport do
  it "instructs a plane to land at an airport" do
    airport1 = Airport.new(7)
    plane1 = Plane.new
    airport1.land(plane1)
    expect(airport1.landed_planes). to eq [plane1]
  end

  it "instructs a plane to take off and confirms it is no longer in the airport" do
    airport1 = Airport.new(10)
    plane1 = Plane.new
    
    airport1.land(plane1)
    airport1.take_off(plane1)
    expect(airport1.landed_planes).to eq []
   
    plane2 = Plane.new
    airport1.land(plane2)
    expect(airport1.take_off(plane2)).to eq "#{plane2} has taken off and is no longer in the airport" 
  end

  it "prevents landing when airport is full" do
    airport = Airport.new(3)
    plane = Plane.new
    
    3.times do
      airport.land(plane)
    end
    expect(airport.land(plane)).to eq "cannot land plane: airport full. "
  end


end


