require "plane.rb"


describe Plane do

let (:plane) {Plane.new}

    it "responds to landed method" do
    expect(plane).to respond_to :landed?
  end

    it "returns true if plane is landed" do
    expect(plane.landed?).to eq true
  end

end
