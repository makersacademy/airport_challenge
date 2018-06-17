require './lib/airport.rb'
describe Airport do

  it {should respond_to(:land)}
  it {should respond_to(:takeoff)}
  it {should respond_to(:grounded_planes)}

  describe "#land" do
    before do
      allow(subject).to receive(:weather?) { false }
    end

    it "lands a plane when airport is empty and weather is good" do
      plane = Plane.new
      expect(subject.land(plane)).to eq [plane]
    end

    it "cannot land plane when airport is full but weather is good" do
      subject.capacity.times {subject.land(Plane.new)}
      expect {subject.land(Plane.new)}.to raise_error(RuntimeError)
    end

    it "cannot land plane when weather is stormy" do
      allow(subject).to receive(:weather?) { true }
      expect {subject.land(Plane.new)}.to raise_error(RuntimeError)
    end
  end

  describe "#takeoff" do
    before do
      allow(subject).to receive(:weather?) { false }
    end

    it "plane takes off after landing" do
      plane = Plane.new
      subject.land(plane)
      expect(subject.takeoff(plane)).to eq plane
    end

    it "cannot #takeoff with empty airport and weather is good" do
      plane = Plane.new
      expect {subject.takeoff(plane)}.to raise_error(RuntimeError)
    end

    it "cannot takeoff with bad weather" do
      plane = Plane.new
      allow(subject).to receive(:weather?) { true }
      expect {subject.takeoff(plane)}.to raise_error(RuntimeError)
    end
  end

  describe "#grounded_planes" do
    it "tells user which planes are on the ground" do
      plane = Plane.new
      plane2 = Plane.new
      allow(subject).to receive(:weather?) { false }
      subject.land(plane)
      subject.land(plane2)
      expect(subject.grounded_planes).to eq [plane, plane2]
    end
  end

  describe "#weather" do
    it "verify that #weather double works" do
      plane = Plane.new
      allow(subject).to receive(:weather?) { true }
      expect(subject.weather?).to eq true
    end
  end

context "user can set default capacity at initialization" do
  it "will set default capacity at 20" do
    expect(subject.capacity).to eq 20
  end

  it "will successfully change DEFAULT_CAPACITY" do
    instance = Airport.new(50)
    expect(instance.capacity).to eq 50
  end
end

context "verify that edge cases pass" do

  describe "#land" do
    it "a landed plane cannot land again" do
      plane = Plane.new
      allow(subject).to receive(:weather?) { false }
      subject.land(plane)
      expect {subject.land(plane)}.to raise_error(RuntimeError)
    end
  end

  describe "#takeoff" do
    before do
      allow(subject).to receive(:weather?) { false }
    end

    it "cannot takeoff if plane is not in airport" do
      plane = Plane.new
      expect {subject.takeoff(plane)}.to raise_error(RuntimeError)
    end


    it "planes already flying cannot takeoff" do
      plane = Plane.new
      subject.land(plane)
      subject.land(Plane.new)
      subject.takeoff(plane)
      expect {subject.takeoff(plane)}.to raise_error(RuntimeError)
    end
  end

end
end
