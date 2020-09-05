require "airport"
require "plane"
require "weather"

describe Airport do
  let(:plane) { Plane.new }

  describe "when the airport is full" do
    it "doesn't allow planes to land" do
      airport = Airport.new(5)
      5.times do
        plane = Plane.new
        plane.land(airport)
      end
      plane = Plane.new
      expect { plane.land(airport) }.to raise_error "Airport is at capacity"
    end

    describe "and an airplane has taken off" do
      it "is no longer at capacity" do
        airport = Airport.new(1)
        plane.land(airport)
        allow(airport).to receive(:generate_weather) { "sunny" }
        plane.take_off
        expect { plane.land(airport) }.not_to raise_error
      end
    end
  end

  # weather

  describe "if the weather is stormy" do
    it "does not allow planes to take off" do
      airport = Airport.new(1)
      allow(airport).to receive(:generate_weather) { "stormy" }
      expect { airport.request_take_off(plane) }.to raise_error "Weather is stormy, unsuitable for take off"
    end
  end

  # capacity
  describe "the airports capacity" do
    it "Checks to see if airport capacity is default" do
      airport = Airport.new
      expect(airport.capacity).to eq Airport::DEFAULT_CAPACITY
    end

    it "Checks to see if airport capacity is the capacity set by system designer" do
      airport = Airport.new(25)
      expect(airport.capacity).to eq 25
    end
  end
end

=begin
describe Airport do
  it { is_expected.to respond_to(:request_to_land) }
  it { is_expected.to respond_to(:take_off) }

  it "Checks to see if airport capacity is default" do
    expect(subject.capacity).to eq Airport::DEFAULT_CAPACITY
  end

  # check if you can have a different capacity

  describe "#take_off" do
    it "Confirms a plane as left the airport" do
      expect { subject.take_off }.to output("The plane has departed\n").to_stdout
    end
  end

  describe "#land" do
    it "checks that planes cannot land if airport is at capacity" do
      Airport::DEFAULT_CAPACITY.times do
        subject.land Plane.new
      end
      expect { subject.land Plane.new }.to raise_error "The airport is at capacity"
    end
  end
end


=end
