require "airport"

describe Airport do

  subject(:airport){ described_class.new }
  let(:plane){ Plane.new}
  let(:weather){ Weather.new}

  context "status of the airport" do

    it {is_expected.to respond_to :planes}

    it "when initialized has no planes(planes is an empty array)" do
      expect(subject.planes).to eq []
    end

    it "when initialized the current weather is set" do
      expect(subject.weather).to_not be_nil
    end

  end

  describe "instruct plan to #land" do

    it {is_expected.to respond_to :land}

    it "- give a confirmation that particular plane landed" do
      expect(subject.land(plane)).to eq "#{plane} has landed"
    end

    it "- keeps info about landed planes" do
      subject.land(plane)
      expect(subject.planes).to eq [plane]
    end

  end

  describe "instruct plan to #takeoff" do

    it {is_expected.to respond_to :takeoff}

    it "- give a confirmation that particular plane took off" do
      weather = double
      allow(weather).to receive(:stormy?).and_return false
      port = Airport.new weather
      expect(port.takeoff(plane)).to eq "#{plane} has taken off"
    end

    it "- update it's info about plane if it took off" do
      weather = double
      allow(weather).to receive(:stormy?).and_return false
      plane1 = Plane.new
      port = Airport.new weather
      port.land(plane)
      port.land(plane1)
      port.takeoff(plane)
      expect(port.planes).to eq [plane1]
    end

    it "- prevent plane to take off if weather is stormy" do
      weather = double
      allow(weather).to receive(:stormy?).and_return true
      port = Airport.new weather
      expect{port.takeoff(plane)}.to raise_error "Storm!Takeoff is not allowed!"
    end

  end

end