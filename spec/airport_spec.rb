require 'spec_helper'
require 'airport'

describe Airport do
  it { is_expected.to respond_to(:order_take_off,
                                :order_landing,
                                :prevent_take_off,
                                :prevent_landing)
  }

  let(:plane) { double("plane", :take_off => true, :land => true) }
  let(:stormy_weather) { double("weather", :stormy? => true) }
  let(:sunny_weather) { double("weather", :stormy? => false) }
  let(:stormy_airport) {Airport.new(stormy_weather)}
  let(:sunny_airport) {Airport.new(sunny_weather)}

  describe "#order_take_off" do

    it "makes a plane take off" do
      expect(plane).to receive(:take_off)
      sunny_airport.order_take_off(plane)
    end

    it "withdraws the plane from the tarmac" do
      sunny_airport.order_landing(plane)
      sunny_airport.order_take_off(plane)
      expect(sunny_airport.tarmac).to be_empty
    end
    
    it "prevents any take-off if the weather is stormy" do
      stormy_airport.order_landing(plane)
      expect { stormy_airport.order_take_off(plane) }.to raise_error("Planes grounded, the weather doesn't allow for take-offs!")
    end

  end

  describe "#order_landing" do

    it "makes a plane land" do
      expect(plane).to receive(:land)
      sunny_airport.order_landing(plane)
    end

    it "adds a plane to the tarmac" do
      sunny_airport.order_landing(plane)
      expect(sunny_airport.tarmac).to eq [plane]
    end

    it "prevents any landing if the weather is stormy" do
      expect { stormy_airport.order_landing(plane) }.to raise_error("Too dangerous to land in this weather!")
    end

  end

end
