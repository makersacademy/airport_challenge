require 'airport'

describe Airport do
  plane = Plane.new

  it "should respond to #land" do
    expect(subject).to respond_to(:land)
  end

  describe "#land" do
    it "should accept one argument" do
      expect(subject).to respond_to(:land).with(1).argument
    end
  end

  it "should allow a plane to land at the airport" do
    expect(subject.land(plane)).to eq([plane])
  end

  it "should respond to #take_off" do
    expect(subject).to respond_to(:take_off)
  end

  describe "#take_off" do
    it "should accept one argument" do
      expect(subject).to respond_to(:take_off).with(1).argument
    end
  end

  it "should release a plane after take off" do
    subject.land(plane)
    expect(subject.take_off(plane)).to eq(plane)
  end

  describe "#airborne?" do
    it "should accept one argument" do
      expect(subject).to respond_to(:airborne?).with(1).argument
    end
  end

  it "should confirm that a plane is no longer in the airport" do
    subject.land(plane)
    subject.take_off(plane)
    expect(subject.airborne?(plane)).to be true
  end

  describe '#land' do
    it "should raise an error when full" do
      plane_1 = Plane.new
      plane_2 = Plane.new
      subject.land(plane_1)
      expect{subject.land(plane_2)}.to raise_error "You can't land here. We're full!"
    end
  end
end 
