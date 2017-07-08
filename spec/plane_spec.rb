require 'plane'

describe Plane do

  let(:plane) { Plane.new }

  it "responds to .full?" do
    expect(subject).to respond_to(:full?)
  end
  it "responds to .landed?" do
    expect(subject).to respond_to(:landed?)
  end
  it "can take an argument at creation to set capacity" do
    expect(plane.capacity).to eq 50
  end
end
