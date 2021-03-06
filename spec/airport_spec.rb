require 'airport'

describe Airport do
  it "responds to request_to_land" do
    is_expected.to respond_to :request_to_land
  end

  it "responds to request_to_take_off" do
    is_expected.to respond_to :request_to_take_off
  end

  describe "#request_to_land" do
    let(:test_airport_land) { Airport.new(1) }

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

  describe "set alternate capacity airports" do
    it "automatically sets a capacity of the airport to a default capacity of 10" do
      expect(subject.airport_capacity).to eq 10
    end

    it "sets an alternative capacity if specified when the airport is created - test capacity of 20" do
      expect(Airport.new(20).airport_capacity).to eq 20
    end

    it "sets an alternative capacity if specified when the airport is created - test capacity of 1" do
      expect(Airport.new(1).airport_capacity).to eq 1
    end

  end
end
