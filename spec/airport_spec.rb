require 'airport'

describe Airport do
    it { expect(subject).to respond_to(:confirm_landing).with(1).argument }

  describe "#initialize" do
    it "creates new empty airport" do
      expect(subject.apron.count).to eq(0)
    end
  end

  describe "#confirm_landing" do
    it "adds plane to apron" do
      plane = double("plane", :landed => false)
      expect{subject.confirm_landing(plane)}.to change{subject.apron.count}.by(1)
    end
  end

  describe "#confirm_takeoff" do
    it "removes plane from apron" do
      plane = double("plane", :landed => false)
      subject.confirm_landing(plane)
      expect{subject.confirm_landing(plane)}.to change{subject.apron.count}.by(1)
    end
  end

end
