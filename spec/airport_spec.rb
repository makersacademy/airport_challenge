require 'airport'

RSpec.describe Airport do

  it "initialises with default capacity unless overridden" do
    airport = Airport.new(15)
    expect(subject.capacity).to eq Airport::DEFAULT_CAPACITY
    expect(airport.capacity).to eq 15
  end

  describe "Checks" do

    context "capacity" do
      it "checks if it is at full capacity" do
        airport = Airport.new(0)
        expect(airport.full?).to eq true
      end
    end

    context "weather" do
      it "checks if weather is stormy" do
        expect(subject.weather).to be(true).or be(false)
      end
    end

    context "planes" do
      let(:plane) { double :plane }
      it "checks if a plane is at the airport" do
        allow(plane).to receive(:land) { subject }
        allow(plane).to receive(:object_id).and_return(plane)
        subject.landed_planes = [plane]
        Airport.any_instance.stub(:weather) { false }
        plane.land(subject)
        expect(subject.at_airport?(plane)).to eq true
      end
    end

  end

end
