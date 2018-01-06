require 'airport'

describe Airport do

  describe "#land" do
    it { is_expected.to respond_to(:land).with(1).argument }
  end

  # it "instructs a plane to take off and confirms that it is no longer in the airport" do
  #   plane = Plane.new
  #   expect(subject.take_off(plane)).to eq "#{plane} is no longer in the aiport"
  # end

  it "land a plane and confirms that the plane is in the airport" do
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

  it "raise an error if plane tries to take off when the weather is stormy " do
      allow(subject).to receive_message_chain(:weather, :storm?) { false }
      plane = Plane.new
      subject.land(plane)
      allow(subject).to receive_message_chain(:weather, :storm?) { true }
      expect { subject.take_off(plane) }.to raise_error("plane canot take off due to stormy weather")
    end

end
