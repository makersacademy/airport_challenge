require 'airplane'
require 'airport'
require 'weather'

describe Airport do
  it "doesn't raise error when creating airport" do
    expect { subject }.not_to raise_error
  end

  it "expects airports to be able to taken in an argument, such as plane" do
    expect(subject).to respond_to(:land).with(1).argument
  end

  it "expects airport to have a list for many planes" do
    expect(subject.planes).to eq []
  end

  it "expects list of planes to contain planes that have landed" do
    plane = Airplane.new
    subject.land(plane)
    expect(subject.planes).not_to be_empty
  end

  it "expects that when plane takes off, it is no longer at airport" do
    plane = Airplane.new
    subject.land(plane)
    subject.take_off(plane)
    expect(subject.planes).to be_empty
  end
end
