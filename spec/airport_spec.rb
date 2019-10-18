require "airport"

describe Airport do
  let(:airport) { Airport.new }
  let(:plane) { double :plane }

  it "successfully instantiates the airport class" do
    expect(airport).to be_instance_of(Airport)
  end

  it "a plane can land at the airport" do
    expect(plane).to receive(:land)
    airport.instruct_landing(plane)
  end

  it "a plane can take off from the airport" do
    expect(plane).to receive(:take_off)
    airport.instruct_take_off(plane)
  end
end
