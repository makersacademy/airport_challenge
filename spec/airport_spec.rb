require 'airport'

describe Airport do
  let(:plane) { double :plane }

  describe "#land" do

    it "expects to see a plane in its hangar after telling it to land" do
      expect(subject.land(plane).last).to eq plane
    end

    it "prevents incoming planes from exceeding the hangar's capacity" do
      subject.sunny_weather
      30.times { subject.land(double(:plane)) }
      expect { subject.land(plane) }.to raise_error "Unable to land plane: max capacity has been reached."
    end

    it "prevents incoming planes from landing if the weather is stormy" do
      subject.cloud_seeding
      expect { subject.land(plane) }.to raise_error "Unable to land plane: weather is stormy."
    end

  end

  describe "#take_off" do
    it "expects to see a plane has left its hangar after telling it to take-off" do
      expect(subject.take_off(plane)).to eq plane
    end

    it "prevents planes from taking off if the weather is bad" do
      subject.land(plane)
      subject.cloud_seeding
      expect {subject.take_off(double(:plane))}.to raise_error "Unable to take-off: weather is stormy."
    end
  end

end