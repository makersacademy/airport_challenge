require_relative  "../airport.rb"


describe Airport do
  it "instructs a plane to land at an airport" do
    expect(subject.land("plane1")). to eq ["plane1"]
  end

  it "instructs a plane to take off and confirms it is no longer in the airport" do
    airport1 = Airport.new
    airport1.land("plane1")
    expect(airport1.take_off("plane1")).to eq "plane1 has taken off and is no longer in the airport" 
  end


end


