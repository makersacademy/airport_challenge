require 'airport'

describe Airport do
  subject(:airport) {described_class.new}
    it {should respond_to(:land).with(1).argument}
    it {should respond_to(:depart)}
    it {should respond_to(:stormy?)}


    plane = Plane.new

    it "is able to tell the plane to land at the airport" do
      airport.land(plane)
      expect(airport.planes).to eq [plane]
  end

  it "is able to tell the plane to depart" do
    airport.depart
    expect(airport.planes).to eq []
  end

  context "when stormy?" do
  before {allow(airport).to receive(:stormy?).and_return(true)}

  it "returns true when the weather is stormy" do
    expect(airport.stormy?).to eq true
  end

  it "raises an error when trying to depart and the weather is stormy" do
    expect{airport.depart}.to raise_error("You cannot take-off, it is too stormy")
  end

  it "raises an error when trying to land and the weather is stormy" do
    expect{airport.land(plane)}.to raise_error("You cannot land, it is too stormy")
  end
end

  it "sets capacity at a default of 20 unless the user sets capacity themselves" do
    expect(airport.capacity).to eq 20
  end

  it "raises an error when tryng to land at a full airport" do
    Airport::DEFAULT_CAPACITY.times {airport.land(plane)}
    expect{airport.land(plane)}.to raise_error("Sorry, the airport is full")
  end

end
