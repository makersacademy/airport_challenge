require 'plane'

describe Plane do
  it "should be able to create an instance of plane" do
    expect(Plane).to respond_to(:new)
  end
end

