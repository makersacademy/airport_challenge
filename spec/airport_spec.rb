require "airport"

describe Airport do
let(:airplane) {double :airplane}
  context "Setup" do
    it "expects an airport class to exist" do
      expect(subject.class).to eq(Airport)
    end

    it "expects airport to only allow 10 airplanes to land by default" do
      expect(subject.airport_capacity).to eq Airport::AIRCRAFT_HANGERS
    end

    it "expects airport to allow as many airplanes to land as the system maintainer sets" do
      airport = Airport.new(40)
      expect(airport.airport_capacity).to eq(40)
  end

  it "expects no airplanes to be at the airport by default" do
    expect(subject.airplanes_on_ground).to be_empty
  end
end


  context "Landing" do

    it "expects airport to respond to a land_at_airport method and pass in a plane" do
      expect(subject).to respond_to(:land_at_airport).with(1).argument
    end

    it "expects a plane in the airplane_on_ground array if a plane has landed" do
      subject.land_at_airport(airplane)
      expect(subject.airplanes_on_ground).to include(airplane)
    end

    # it "expects airport to respond to a landed? method" do
    #   expect(subject).to respond_to(:landed?)
    # end
    #
    # # it "expects landed? to be true if the plane has landed" do
    # #   expect(subject).to be_landed
    # # end

  end

  context "Take Off" do

    it "expects airport to respond to a take_off method" do
      expect(subject).to respond_to(:take_off)
    end

  end
end
