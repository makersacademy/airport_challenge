require 'airport'
require 'weather'

describe Airport do

  let(:airport) { Airport.new}


  it "respond to planes" do
    expect(airport).to respond_to :planes
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
    it "returns a boolean when called" do
      expect(airport.stormy?).to eq true || false
    end
  end



end
