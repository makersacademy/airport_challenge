require 'airport'
require 'weather'

describe Airport do
let(:plane) {double :plane}

  describe "in sunny conditions" do

    let(:sunny_weather) { double Weather, condition: "sunny" }

    it "allows a plane to land" do
      subject.land(plane, sunny_weather)
      expect(subject.planes).to include(plane)
    end

    it "allows a plane to take off from an airport" do
      subject.land(plane, sunny_weather)
      subject.take_off(plane, sunny_weather)
      expect(subject.planes).not_to include(plane)
    end

    it "allows the user to check if a plane is in the airport" do
      subject.land(plane, sunny_weather)
      expect(subject.is_plane_present?(plane)).to eq(true)
      subject.take_off(plane)
      expect(subject.is_plane_present?(plane)).to eq(false)
    end

    it "prevents planes landing if capacity is full" do
      subject.DEFAULT_CAPACITY.times { subject.land(plane, sunny_weather) }
      expect { subject.land(plane) }.to raise_error(RuntimeError)
    end
  end

  describe "in stormy conditions" do
    let(:stormy_weather) { double Weather, condition: "stormy" }

    it "prevents planes taking off if weather is stormy" do
      expect { subject.take_off(plane, stormy_weather) }.to raise_error(RuntimeError)
    end

    it "prevents planes landing if weather is stormy" do
      expect { subject.land(plane, stormy_weather) }.to raise_error(RuntimeError)
    end
  end

  describe "allows capacity to be set" do
    it "sets default capacity to 10 when initialize with 10" do
      new_airport = Airport.new(10)
      expect(new_airport.DEFAULT_CAPACITY).to eq(10)
    end
  end
end
