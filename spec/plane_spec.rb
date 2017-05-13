require "plane"

describe Plane do
  it "responds to the #land_at method" do
    expect(subject).to respond_to(:land_at)
  end
  it "respond to the #take_off method" do
    expect(subject).to respond_to(:take_off)
  end

end