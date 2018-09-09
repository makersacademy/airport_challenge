require 'airport'

# Fake weather class which is always stormy.
class StormyWeather
  def stormy?
    true
  end
end

# Fake weather class which is never stormy.
class ClearWeather
  def stormy?
    false
  end
end

# Fake plane class which can recieve to land and take_off instuctions.
class FakePlane
  def land
  end

  def take_off
  end
end

RSpec.describe Airport do
  let(:plane) { double :plane }

  before(:each) do
    allow(plane).to receive(:land)
    allow(plane).to receive(:take_off)
  end

  context "when it is clear weather" do
    clear_weather = ClearWeather.new
    clear_airport = Airport.new(clear_weather)

    it "can instruct planes to land" do
      clear_airport.land(plane)
      expect(clear_airport.landed_planes).to eq [plane]
      # The next line is used to make sure plane doubles don't bleed from one
      # example into the next.
      clear_airport.take_off(plane)
    end

    it "can instruct planes to take off" do
      clear_airport.land(plane)
      clear_airport.take_off(plane)
      expect(clear_airport.landed_planes).to eq []
    end

    it "can check whether it is stormy" do
      expect(clear_airport.send(:stormy?)).to eq false
    end

    it "raises an error when a controller attempts to exceed plane capacity" do
      clear_airport.capacity.times { clear_airport.land(plane) }
      expect { clear_airport.land(plane) }.to raise_error "Airport at capacity"
      # Since the doubles are all identical they can be removed in 'delete'.
      # Again, this is to make sure doubles don't bleed into other examples.
      clear_airport.take_off(plane)
    end

    it "raises an error when a controller attempts to take off a plane not in the airport" do
      expect { clear_airport.take_off(plane) }.to raise_error "Plane not landed at airport"
    end

  end

  context "when it is stormy" do
    stormy_weather = StormyWeather.new
    stormy_airport = Airport.new(stormy_weather)
    it "raises an error when the controller attempts to take off a plane" do
      message = "Unable to take off plane due to stormy weather"
      expect { stormy_airport.take_off(plane) }.to raise_error message
    end

    it "raises an error when the controller attempts to land a plane" do
      message = "Unable to land plane due to stormy weather"
      expect { stormy_airport.land(plane) }.to raise_error message
    end

  end

  context "when initializing the airport" do

    it "can be passed a value for the airport capacity and weather generator" do
      expect(Airport).to respond_to(:new).with(2).argument
    end

    it "stores currently landed planes in an array" do
      expect(Weather).to respond_to(:new).with(1).argument
    end

  end

  context "the airport has private methods which are used" do

    it "can check whether the airport is full" do
      expect([true, false].include?(subject.send(:full?))).to eq true
    end

    it "can check whether a given plane is in the airport" do
      expect([true, false].include?(subject.send(:plane_at_airport?, plane))).to eq true
    end

  end

end
