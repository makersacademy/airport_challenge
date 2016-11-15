require "airport"

describe Airport do

  describe "initialization" do
    subject { Airport.new }
    let(:boeing) { Aeroplane.new }
    it "defaults capacity" do
      described_class::DEFAULT_CAPACITY.times do
        subject.land(boeing)
      end
      expect{ (subject.land(boeing)) }.to raise_error "Airport too full to allow the plane to land"
    end
  end

  describe "#allow_takeoff" do
    it "allows a plane to takeoff" do
      boeing = Aeroplane.new
      subject.land(boeing)
      expect(subject.allow_takeoff).to eq boeing
  end

  describe "#land" do
    it "raises an error when it is full" do
      subject.capacity.times { subject.land(Aeroplane.new) }
      expect { subject.land(Aeroplane.new) }.to raise_error "Airport too full to allow the plane to land"
    end
  end

    it "raises an error when it is not safe to allow takeoff" do
      expect { subject.allow_takeoff }.to raise_error "Not safe to allow take off"
    end
  end

  it "responds to 'allow_takeoff'" do
    expect(subject).to respond_to :allow_takeoff
  end

  it "should respond to 'land' with one argument" do
    expect(subject).to respond_to(:land).with(1).argument
  end

  it "has a default capacity" do
    expect(subject.capacity).to eq Airport::DEFAULT_CAPACITY
  end

end
