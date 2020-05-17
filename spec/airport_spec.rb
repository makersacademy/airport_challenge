require 'airport'

describe Airport do
  subject { Airport.new }

  let(:plane) { Plane.new }

  before do
    plane.land(subject)
  end

  it "allows a plane to land and takes one argument" do
    expect(subject).to respond_to(:land).with(1).argument
  end

  it "adds a plane to the airport" do
    expect(subject.instance_variable_get(:@hanger)).to eq(plane)
  end

  it "removes a plane from the airport" do
    subject.take_off(plane)
    expect(subject.instance_variable_get(:@hanger)).to eq(nil)
  end
end
