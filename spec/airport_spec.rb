require './lib/airport'
require './lib/plane'

describe Airport do
  attr_reader :plane
  it { should respond_to :takeoff }
  it { should respond_to(:land).with(1).argument }

  it "Takes off a plane" do
    plane = subject.takeoff
  end

  it "lands a plane" do
    plane = Plane.new
    expect(subject.land(plane)).to eq "Plane landed."
  end
end
