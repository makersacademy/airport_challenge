require_relative  "../airport.rb"


describe Airport do
  it "instructs a plane to land at an airport" do
    airport1= Airport.new
    airport1.land("plane1")
    expect(airport1.landed_planes). to eq ["plane1"]
  end

  it "instructs a plane to take off and confirms it is no longer in the airport" do
    airport1 = Airport.new
    airport1.land("plane1")
    airport1.take_off("plane1")
    expect(airport1.landed_planes).to eq []
    expect(subject.take_off("plane2")).to eq "plane2 has taken off and is no longer in the airport" 
  end


end


