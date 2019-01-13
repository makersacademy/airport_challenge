require 'airport_challenge'

describe Airport do
  it { is_expected.to respond_to(:planes) }
  describe "#land" do
    before(:each) do
      allow(subject).to receive(:weather_report) { :sunny }
    end

    it "can instruct a PLANE to LAND" do

      expect(subject).to respond_to(:land).with(1).arguments
      expect { subject.land(Plane.new) }.to_not raise_error
    end

    it "cannot LAND planes already in airport" do
      pointer = Plane.new
      subject.land(pointer)
      expect { subject.land(pointer) }.to raise_error("Plane has already landed!")
    end

    it "prohibits landing when WEATHER is stormy" do
      pointer = Plane.new
      allow(subject).to receive(:weather_report) { :stormy }
      expect { subject.land(pointer) }.to raise_error("Can't land during stormy weather")
    end

    it "stores LANDed planes in PLANES" do
      pointer = Plane.new
      subject.land(pointer)
      expect(subject.planes.include?(pointer)).to eq(true)
    end
    it "throws error when attempting to land plane at maximum capacity" do
      (subject.max_capacity - subject.planes.length).times { subject.land(Plane.new) }
      expect { subject.land(Plane.new) }.to raise_error("Airport at full capacity!")
    end
  end

  describe "#airport_contains?" do
    it "reports if a PLANE object already exists in the airport" do
      allow(subject).to receive(:weather_report) { :sunny }
      pointer = Plane.new
      subject.land(pointer)
      expect(subject.airport_contains?(pointer)).to be(true)
    end
  end

  describe "#takeoff" do
    it "can instruct a PLANE to TAKEOFF in sunny weather" do
      allow(subject).to receive(:weather_report) { :sunny }
      expect(subject).to respond_to(:takeoff).with(1).arguments
      pointer = Plane.new
      subject.land(pointer)
      expect { subject.takeoff(pointer) }.to_not raise_error
    end

    it "only TAKEOFFs planes already in airport" do
      expect { subject.takeoff(Plane.new) }.to raise_error("Plane not found!")
    end

    it "planes in TAKEOFF no longer are in PLANES" do
      allow(subject).to receive(:weather_report) { :sunny }
      pointer = Plane.new
      subject.land(pointer)
      subject.takeoff(pointer)
      expect(subject.planes.include?(pointer)).to eq(false)
    end
    it "prohibits takeoff when WEATHER is stormy" do
      allow(subject).to receive(:weather_report) { :sunny }
      pointer = Plane.new
      subject.land(pointer)
      allow(subject).to receive(:weather_report) { :stormy }
      expect { subject.takeoff(pointer) }.to raise_error("Can't take off during stormy weather")
    end
  end

  describe "#max_capacity" do
    it "has a maximum plane capacity" do
      expect(subject.max_capacity).to be_a(Integer)
    end
    it "can change maximum plane capacity with argument at initialization" do
      new_cap = subject.max_capacity + 1
      example = Airport.new(new_cap)
      expect(example.max_capacity).to eq(subject.max_capacity + 1)
    end
    it "throws errors if given less than 0 or non-integer" do
      expect { Airport.new(-1) }.to raise_error("Invalid argument")
      expect { Airport.new("hello!") }.to raise_error("Invalid argument")
    end
  end

  describe "#at_capacity?" do
    it "reports being at max capacity" do
      allow(subject).to receive(:weather_report) { :sunny }
      (subject.max_capacity - subject.planes.length).times { subject.land(Plane.new) }
      expect(subject.at_capacity?).to eq(true)
    end
  end

  describe "#new_cap" do
    it "can change maximum capacity at any time" do
      new_cap = subject.max_capacity + 1
      subject.change_capacity(new_cap)
      expect(subject.max_capacity).to eq(new_cap)
    end
    it "throws error if maximum capacity is changed to smaller than current amount
       of PLANES" do
      allow(subject).to receive(:weather_report) { :sunny }
      3.times { subject.land(Plane.new) }
      new_cap = subject.planes.length - 1
      expect { subject.change_capacity(new_cap) }.to raise_error("Current number of planes (#{subject.planes.length}) will exceed new capacity (#{new_cap})")
    end
    it "only accepts 0 or positive integers" do
      expect { subject.change_capacity(-1) }.to raise_error("Invalid Argument")
      expect { subject.change_capacity("hi!") }.to raise_error("Invalid Argument")
    end
  end

end
