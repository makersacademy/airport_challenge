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
    expect(subject.instance_variable_get(:@hanger)).to include(plane)
  end

  it "alerts airport is full" do
    10.times { subject.land(Plane.new) }
    expect { subject.land(Plane.new) }.to raise_error("Airport Full!")
  end

  it "removes a plane from the airport" do
    subject.take_off(plane)
    expect(subject.instance_variable_get(:@hanger)).not_to include(plane)
  end

  it "alerts when plane has departed" do
    expect { subject.depart(plane) }.to output("#{plane} departed\n").to_stdout
  end
end
