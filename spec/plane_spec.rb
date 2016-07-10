require "plane"

describe Plane do
  subject(:plane) {Plane.new}
  it "responds to flying status method" do
    expect(plane).to respond_to :flying?
  end
  it "starts off flying" do
    expect(plane.flying?).to eq true
  end



  #describe "#landed?" do
  #  subject(:plane) {Plane.new} #give new instance name plane
  #  it "responds to landed?" do
  #    expect(plane).to respond_to :landed?
  #  end
  #end
end
