require 'spec_helper'
require 'airport'

describe Airport do
  it { is_expected.to respond_to(:order_take_off, :order_landing,) }

  let(:flying_plane) { 
    double(
      "flying_plane",
      :take_off => nil,
      :land => nil,
      :flying? => true
    )
  }
  let(:landed_plane) { 
    double(
      "flying_plane",
      :take_off => nil,
      :land => nil,
      :flying? => false
    )
  }
  let(:stormy_weather) { double("weather", :stormy? => true) }
  let(:sunny_weather) { double("weather", :stormy? => false) }
  let(:stormy_airport) { Airport.new(stormy_weather) }
  let(:sunny_airport) { Airport.new(sunny_weather) }

  describe "#order_take_off" do

    it "makes a plane take off" do
      plane = landed_plane
      airport = Airport.new(sunny_weather, [plane])
      expect(landed_plane).to receive(:take_off)
      airport.order_take_off(landed_plane)
    end

    it "withdraws the plane from the tarmac" do
      plane = landed_plane
      airport = Airport.new(sunny_weather, [plane])
      airport.order_take_off(plane)
      expect(airport.tarmac).to be_empty
    end
    
    it "prevents any take-off if the weather is stormy" do
      airport = Airport.new(stormy_weather, [landed_plane])
      expect { airport.order_take_off(landed_plane) }.to raise_error("The weather doesn't allow for take-offs!")
    end

    it "raises an error if the plane is not landed at the airport" do
      expect { sunny_airport.order_take_off(landed_plane) }.to raise_error(
          "This plane is not landed at this airport"
        )
    end

  end

  describe "#order_landing" do

    it "makes a plane land" do
      expect(flying_plane).to receive(:land)
      sunny_airport.order_landing(flying_plane)
    end

    it "adds a plane to the tarmac" do
      sunny_airport.order_landing(flying_plane)
      expect(sunny_airport.tarmac).to eq [flying_plane]
    end

    it "prevents any landing if the weather is stormy" do
      expect { stormy_airport.order_landing(flying_plane) }.to raise_error("Too dangerous to land in this weather!")
    end

    it "prevents landing when airport is full" do
      sunny_airport.capacity.times { sunny_airport.order_landing(flying_plane) }
      expect { sunny_airport.order_landing(flying_plane) }.to raise_error("Landing denied, airport is full.")
    end

    it "raises an error if the plane is already landed" do
      expect {
        sunny_airport.order_landing(landed_plane)
      }.to raise_error "Can't make a plane land when it's not flying."
    end

  end

end
