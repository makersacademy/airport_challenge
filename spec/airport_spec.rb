require 'airport'
require 'plane'

describe Airport do
  let(:gatwick) { described_class.new }
  let(:wings) { Plane.new }
  
  it "instruct a plane to land" do
    expect(gatwick).to respond_to(:land).with(1).argument
  end
  it "land a plane in the airport" do
    expect(gatwick.land(wings)).to eq [wings]
  end
end