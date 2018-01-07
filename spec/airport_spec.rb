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

  it "raise an error if plane tries to take off when there is a storm" do
    allow(subject).to receive_message_chain(:weather, :storm?) { false }
    plane = Plane.new
    subject.land(plane)
    allow(subject).to receive_message_chain(:weather, :storm?) { true }
    expect { subject.take_off(plane) }.to raise_error "plane cannot take off due to a storm"
  end

  it "raise an error if plane tries to land when there is a storm" do
    plane = Plane.new
    allow(subject).to receive_message_chain(:weather, :storm?) { true }
    expect { subject.land(plane) }.to raise_error "plane cannot land due to a storm"
  end

  it "raise error when plane attempts landing at full airport " do
    allow(subject).to receive_message_chain(:weather, :storm?) { false }
    plane = Plane.new
    50.times { subject.land(Plane.new) }
    expect { subject.land(plane) }.to raise_error("the airport is currently full")
  end

  it "raise error if plane is asked to take off but is not at the airport" do
    allow(subject).to receive_message_chain(:weather, :storm?) { false }
    plane = Plane.new
    expect { subject.take_off(plane) }.to raise_error("plane not currently at airport")
  end

  it "should raise error if plane tries to land but is already in airport" do
    allow(subject).to receive_message_chain(:weather, :storm?) { false }
    plane = Plane.new
    subject.land(plane)
    expect { subject.land(plane) }.to raise_error("plane has already landed")
  end

  describe "initialization" do
    subject { Airport.new }
    it "checks default aiport capacity" do
      allow(subject).to receive_message_chain(:weather, :storm?) { false }
      described_class::DEFAULT_CAPACITY.times do
        subject.land(Plane.new)
      end
      expect { subject.land(Plane.new) }.to raise_error "the airport is currently full"
    end
  end

  describe "initialization" do
    subject { Airport.new(35) }
    # let(:plane) { Plane.new }
    it "checks custom airport capacity of 35" do
      allow(subject).to receive_message_chain(:weather, :storm?) { false }
      subject.capacity.times do
        subject.land(Plane.new)
      end
      expect { subject.land(Plane.new) }.to raise_error "the airport is currently full"
    end
  end
end
#
