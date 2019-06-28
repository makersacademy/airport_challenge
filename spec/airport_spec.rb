require 'airport'

describe Airport do
  let(:plane) { double :plane }
  it "has no planes when instantiated" do
    expect(subject.planes).to eq []
  end
  it "houses a plane that has landed" do
    subject.stormy = false
    subject.receive(plane)
    expect(subject.planes).to include plane
  end
  it "releases a plane for take off" do
    subject.stormy = false
    subject.receive(plane)
    expect(subject.send(plane)).to eq plane
  end
  it "throws an error when it's stormy and a plane tries to land or take off" do
    subject.stormy = true
    expect { subject.receive(plane) }.to raise_error
    expect { subject.send(plane) }.to raise_error
  end
  it "can set capacity or provide a default if none is set" do
    p subject.capacity
    expect(subject.capacity).to eq 20
    test = Airport.new("test", 16)
    expect(test.capacity).to eq 16
  end
end
