require 'airport'
require 'weather'

describe Airport do

  let(:airport) { Airport.new}

  it "has a default capacity of 20" do
    expect(airport.capacity).to eq Airport::CAPACITY
  end

  it "can be initialized with an different capacity" do
    airport2 = Airport.new(25)
    expect(airport2.capacity).to eq 25
  end
  
  describe '#planes' do
    it "respond to planes" do
      expect(airport).to respond_to :planes
    end
  end


  describe '#landed_at' do
    it "respond to landed_at" do
      expect(airport).to respond_to(:landed_at).with(1).argument
    end
    it "adds landing plane to planes when landed" do
      plane = double("plane")
      old_number = airport.planes.length
      airport.landed_at(plane)  # using double
      expect(airport.planes.length).to eq old_number += 1
    end
  end

  describe '#departed' do
    it "respond to departed" do
      expect(airport).to respond_to(:departed).with(1).argument
    end
    it "deletes departed plane from planes when departed" do
      plane = double("plane")
      airport.landed_at(plane) # must be an plane on the airport
      old_number = airport.planes.length
      airport.departed(plane) # using double
      expect(airport.planes.length).to eq old_number -= 1
    end
  end

  describe '#stormy?' do
    it "responds to stormy?" do
      expect(airport).to respond_to :stormy?
    end
    it "returns a boolean when called" do
      dbl = double("stormy?")
      expect(dbl).to receive(:stormy?)
      dbl.stormy?
    end
  end

  describe '#ready_for_take_off?' do
    it "respond to ready_for_take_off" do
      expect(airport).to respond_to :ready_for_take_off?
    end
    it "returns false when weather is stormy" do
      dbl = double("ready_for_take_off?")
      expect(dbl).to receive(:ready_for_take_off?)
      dbl.ready_for_take_off?
    end
  end

  describe '#ready_for_landing?' do
    it "responds to ready_for_landing?" do
      expect(airport).to respond_to :ready_for_landing?
    end
    it "returns false when weather is stormy" do
      dbl = double("ready_for_landing?")
      expect(dbl).to receive(:ready_for_landing?)
      dbl.ready_for_landing?
    end
  end

  describe "#full?" do
    it "responds to full?" do
      expect(airport).to respond_to :full?
    end
    it "returns false when airport isn't full" do
      expect(airport.full?).to eq false
    end
    it "returns true when airport is full" do
      20.times {airport.landed_at("plane") }
      expect(airport.full?).to eq true
    end
  end

end
