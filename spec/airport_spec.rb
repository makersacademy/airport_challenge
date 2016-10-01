require "airport"

describe Airport do
  subject(:airport) {described_class.new}
  plane = Plane.new

  #1
  it "1. checks existance of the class Airport" do
    expect(airport.class).to eq Airport
  end

  #2
  it "2. plane can land at airport - land method" do
    expect(airport).to respond_to(:land).with(1).argument
  end

  #3
  it "3. confirmation message that the plane has landed" do
  expect(airport.land(plane)).to eq "The plane has landed"
  end

  #4
  it "4. raises an error if plane attempts to land and no gates are available" do
    airport_size0 = Airport.new(0,false)
    expect{airport_size0.land(plane)}.to raise_error "No gates available - cannot land plane"
  end

  #5
  it "5. a plane can depart from the airport - take_off method" do
    expect(airport).to respond_to(:take_off).with(1).argument
  end

  #6
  it "6. confirmation message that the plane has departed" do
    airport.land(plane)
    expect(airport.take_off(plane)).to eq "The plane has departed"
  end

  #7
  it "7. raises an error when there are no planes to depart for take_off method" do
    expect{airport.take_off(plane)}. to raise_error "There are no planes currently at the airport - No departures"
  end


end
