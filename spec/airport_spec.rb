require 'airport'

describe Airport do
  let(:plane) { double :plane }

  describe "#land" do
    it "expects to see a plane in its hangar after telling it to land" do
      expect(subject.land(plane).last).to eq plane
    end

    it "prevents incoming planes from exceeding the hangar's capacity" do
      subject.sunny_weather
      Airport::DEFAULT_CAPACITY.times { subject.land(double(:plane)) }
      expect { subject.land(plane) }.to raise_error "Unable to land plane: max capacity has been reached."
    end

    it "prevents incoming planes from landing if the weather is stormy" do
      subject.cloud_seeding
      expect { subject.land(plane) }.to raise_error "Unable to land plane: weather is stormy."
    end
  end

  describe "#take_off" do
    before(:each) do
      subject.sunny_weather
    end
    it "expects to see a plane has left its hangar after telling it to take-off" do
      subject.land(plane)
      expect(subject.take_off(plane)).to eq plane
    end

    it "prevents planes from taking off if the weather is bad" do
      subject.land(plane)
      subject.cloud_seeding
      expect {subject.take_off(double(:plane))}.to raise_error "Unable to take-off: weather is stormy."
    end

    it "only allows planes that are in the aiport to take-off from that airport" do
      airport = Airport.new
      airport.sunny_weather
      airport.land(plane)
      expect {subject.take_off(plane)}.to raise_error "Unable to take-off: this plane is not in this airport!"
    end
  end

  describe "#capacity" do
    it "supports airports to adjust capacity as and when required" do
      airport = Airport.new(20)
      airport.sunny_weather
      20.times {airport.land(double(:plane))}
      expect{airport.land(plane)}.to raise_error "Unable to land plane: max capacity has been reached."
      airport.capacity = 40
      20.times {airport.land(double(:plane))}
      expect{airport.land(double(:plane))}.to raise_error "Unable to land plane: max capacity has been reached."
    end
  end

end