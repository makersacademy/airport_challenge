require 'airport'

describe Airport do
  it "responds to request_to_land" do
    is_expected.to respond_to :request_to_land
  end

  it "responds to request_to_take_off" do
    is_expected.to respond_to :request_to_take_off
  end

  describe "#request_to_land" do
    let(:test_airport_land) { subject }

    it "lands a plane succesfully and responds with a confirmation - 'Plane has landed.'" do
      expect(test_airport_land.request_to_land(Plane.new)).to eq "Plane has landed."
    end

    it "cannot land a plane if the airport is full - provides rejection message - 'Plane cannot land, Airport is full.'" do
      test_airport_land.request_to_land(Plane.new)
      expect(test_airport_land.request_to_land(Plane.new)).to eq "Plane cannot land, Airport is full."
    end
  end

  describe "#request_to_take_off" do
    it "takes off a plane succesfully and responds with a confirmation - 'Plane has taken off.'" do
      expect(subject.request_to_take_off(Plane.new)).to eq "Plane has taken off."
    end
  end
end
