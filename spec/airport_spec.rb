require './lib/airport.rb'

describe Airport do

  let(:plane) {double :plane}
  let(:plane2) {double :plane}

  context "Make sure the class Airport responds to all of it's methods" do

    it "Expects Airport to respond to it's landing_bay method" do
      expect(subject).to respond_to(:landing_bay)
    end

    it "Expects Airport to respond to it's store plane method" do
      expect(subject).to respond_to(:store_plane).with(1).argument
    end

    it "Expects the airport to respond to it's force_plane_to_take_off method" do
      expect(subject).to respond_to(:force_plane_to_take_off).with(1).argument
    end
  end

  context "Checks if the airport stores planes correctly" do
    it "expecting that when a plane lands the landing bay is docked with a plane" do
      subject.store_plane(plane)
      subject.store_plane(plane)

      expect(subject.landing_bay.shift).to eq plane
    end

    it "checks that planes are stored in an array" do
      subject.store_plane(plane)

      expect(subject.landing_bay.class).to eq Array
    end

    it "checks that when a plane has taken off that it is removed from landing bay" do
      allow(plane).to receive(:switch_flying).and_return(true)
      allow(plane2).to receive(:switch_flying).and_return(true)

      subject.store_plane(plane)
      subject.store_plane(plane2)
      subject.force_plane_to_take_off(plane)

      expect(subject.landing_bay.size).to eq 1
    end


  end
end
