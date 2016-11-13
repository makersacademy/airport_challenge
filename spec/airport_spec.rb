require "airport"

describe Airport do

  describe "#allow_takeoff" do
    it "allows a plane to takeoff" do
      plane = Aeroplane.new
      subject.land(plane)
      expect(subject.allow_takeoff).to eq plane
  end

  describe "#land" do
    it "raises an error when it is full" do
      subject.land(Aeroplane.new)
      expect { subject.land Aeroplane.new }.to raise_error "Airport too full to allow the plane to land"
    end
  end

    it "raises an error when it is too stormy to allow takeoff" do
      expect { subject.allow_takeoff }.to raise_error "Too stormy to allow take off"
    end
  end

  it "responds to 'allow_takeoff'" do
    expect(subject).to respond_to :allow_takeoff
  end

  it "should respond to 'land' with one argument" do
    expect(subject).to respond_to(:land).with(1).argument
  end

  it "should respond to 'plane'" do
    expect(subject).to respond_to(:plane)
  end

  it "returns landed planes" do
    plane = Aeroplane.new
    subject.land(plane)
    expect(subject.plane).to eq plane
  end

end
