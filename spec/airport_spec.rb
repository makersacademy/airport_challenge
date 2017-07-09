require 'airport'

describe Airport do
  subject(:airport) {described_class.new}
    it {should respond_to(:land).with(1).argument}
    it {should respond_to(:depart).with(1).argument}

    plane = Plane.new

    it "is able to tell the plane to land at the airport" do
      airport.land(plane)
      expect(airport.planes).to eq [plane]
  end

  it "is able to tell the plane to depart" do
    airport.depart(plane)
    expect(airport.planes).to eq []
  end

  it "raises an error when trying to depart and the weather is stormy" do
    expect{airport.depart(plane)}.to raise_error("You cannot take-off, it is too stormy")
  end
end
