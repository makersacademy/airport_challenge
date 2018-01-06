require 'airport'

describe Airport do

  describe "#land" do
    it { is_expected.to respond_to(:land).with(1).argument }
  end

  it "checks that a landed plane is in the airport" do
    allow(subject).to receive_message_chain(:weather, :storm?) { false }
    plane = Plane.new
    subject.land(plane)
    expect(subject.planes.sample).to eq plane
  end

  it "check that a plane has left the aiport after take off" do
    allow(subject).to receive_message_chain(:weather, :storm?) { false }
    plane = Plane.new
    subject.land(plane)
    subject.take_off(plane)
    expect(subject.planes.empty?).to eq true
  end

  it "raise an error if plane tries to take off when the weather is stormy" do
    allow(subject).to receive_message_chain(:weather, :storm?) { false }
    plane = Plane.new
    subject.land(plane)
    allow(subject).to receive_message_chain(:weather, :storm?) { true }
    expect { subject.take_off(plane) }.to raise_error "plane cannot take off due to stormy weather"
  end

  it "raise an error if plane tries to land when the weather is stormy" do
    plane = Plane.new
    allow(subject).to receive_message_chain(:weather, :storm?) { true }
    expect { subject.land(plane) }.to raise_error "plane cannot land due to stormy weather"
  end

  it "raise error when plane attempts landing at full airport " do
    allow(subject).to receive_message_chain(:weather, :storm?) { false }
    plane = Plane.new
    50.times { subject.land(Plane.new) }
    expect { subject.land(plane) }.to raise_error("the airport is currently full")
  end
end
