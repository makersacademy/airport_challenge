require 'airport'

describe Airport do
let(:plane) {double :plane}
  it "responds to landing method" do
    expect(subject).to respond_to(:land).with(1).argument
  end

  it "allows a plane to land" do
    subject.land(plane)
    expect(subject.planes).to include(plane)
  end

end
