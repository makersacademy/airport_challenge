require 'plane'

describe Plane do
  it "responds to call to #land from Air Traffic Controller" do
    expect(subject).to respond_to(:land)
  end
  it "Responds to call to #take_off from Air Traffic Controller" do
    expect(subject).to respond_to(:take_off)
  end
end
