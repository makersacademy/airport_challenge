require './lib/airport.rb'

describe Airport do

  let(:plane) {double :plane}

  context "Make sure the class Airport responds to all of it's methods" do

    it "Expects Airport to respond to it's landing_bay method" do
      expect(subject).to respond_to(:landing_bay)
    end

    it "Expects Airport to respond to it's store plane method" do
      expect(subject).to respond_to(:store_plane).with(1).argument
    end
  end

  context "Checks if the airport stores planes correctly" do
    it "expecting that when a plane lands the landing bay is docked with a plane" do
      subject.store_plane(plane)
      subject.store_plane(plane)

      expect(subject.landing_bay.shift).to eq plane
      expect(subject.landing_bay.class).to eq Array
    end
  end
end
