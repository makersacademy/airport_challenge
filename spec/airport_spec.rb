require 'airport'

describe Airport do
  subject(:airport) {described_class.new}
    it {should respond_to(:instruct_to_land).with(1).argument}
    it {should respond_to(:instruct_depart).with(1).argument}

    plane = Plane.new

    it "is able to tell the plane to land at the airport" do
      airport.instruct_to_land(plane)
      expect(airport.planes).to eq [plane]
  end

  it "is able to tell the plane to depart" do
    airport.instruct_depart(plane)
    expect(airport.planes).to eq []
  end

end
