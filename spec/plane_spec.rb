require "plane.rb"
require "airport.rb"

describe Plane do

let (:plane) {Plane.new}

describe "#landed?" do

    it "responds to landed method" do
    expect(plane).to respond_to :landed?
    end

    it "returns false if plane has not been landed" do
    expect(plane.landed?).to eq false
    end
  end

describe "#land" do

    it "responds to land method" do
    expect(plane).to respond_to :land
    end

    it "returns true if plane has been landed" do
    airport = Airport.new
    airport.land(plane)
    expect(plane.landed?).to eq true
    end
  end

end
