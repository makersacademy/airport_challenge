require "airport"

describe Airport do
  let(:taking_off_plane){double(:plane, take_off: true )}
  let(:landing_plane){double(:plane, land: true )}

  let(:plane){double(:plane, flying?: true, land: true, take_off: true)}

  before do
    allow(subject).to receive(:weather).and_return "sunny"
  end

  it "has a capacity" do
    expect(subject).to respond_to(:capacity)
  end

  it "has weather" do
    expect(subject).to respond_to(:weather)
  end

  describe "#request_landing" do
    it "receives a plane" do
      subject.request_landing(plane)
      expect(subject.planes).to include(plane)
    end

    it "raises error if over capacity" do
      subject.capacity.times {subject.request_landing(plane)}
      expect{subject.request_landing(plane)}.to raise_error "landing request denied, Airport is full"
    end

    it "allows capacity to be specified at initialization" do
      random_number = rand(1..100)
      airport = Airport.new(random_number)
      expect(airport.capacity).to eq(random_number)
    end

    it "does not allow if weather is stormy" do
      allow(subject).to receive(:weather).and_return("stormy")
      expect{subject.request_landing plane}.to raise_error "request denied, weather conditions are unsafe"
    end
  end

  describe "#request_take_off" do
    it "releases plane when successful" do
      subject.planes << plane
      subject.request_take_off(plane)
      expect(subject.planes).not_to include(plane)
    end

    it "raises error if plane not in the airport" do
      expect{subject.request_take_off plane}.to raise_error "take off request denied, Plane is not at this airport"
    end

    it "does not allow if weather is stormy" do
      subject.planes << plane
      allow(subject).to receive(:weather).and_return("stormy")
      expect{subject.request_take_off plane}.to raise_error "request denied, weather conditions are unsafe"
    end
  end
end


