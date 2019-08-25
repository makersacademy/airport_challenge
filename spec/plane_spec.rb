require 'plane.rb'

describe "#get_id" do
  it "gets the ID of a plane" do
    expect(Plane.new("BA1")).to respond_to(:plane_id)
  end
end

describe "#get_id" do
  it "gets the ID of a plane" do
    expect(Plane.new("BA1").plane_id).to eq("BA1")
  end
end

describe "#get_id" do
  it "gets the ID of a plane" do
    expect(Plane.new("BA2").plane_id).to eq("BA2")
  end
end
