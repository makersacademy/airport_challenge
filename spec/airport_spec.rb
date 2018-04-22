require 'airport'

describe Airport do
let(:plane) {double :plane}

  it "allows a plane to land" do
    subject.land(plane)
    expect(subject.planes).to include(plane)
  end

  it "responds to take_off method" do
    expect(subject).to respond_to(:take_off).with(1).argument
  end

  it "allows a plane to take off from an airport" do
    subject.land(plane)
    subject.take_off(plane)
    expect(subject.planes).not_to include(plane)
  end
end
