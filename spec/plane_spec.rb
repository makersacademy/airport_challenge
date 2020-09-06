require 'plane'

describe Planes do
  plane = Planes.new
  it "responds to method flying" do
    expect(plane).to respond_to :flying
  end
  it "returns flying method true by default" do
    expect(plane.flying).to eq true
  end
end
