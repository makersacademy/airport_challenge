require 'airport'

describe Airport do

  let(:airport) { Airport.new}

  it "respond to planes" do
    expect(airport).to respond_to :planes
  end

  describe '#has_landed' do
    it "respond to has_landed" do
      expect(airport).to respond_to(:has_landed).with(1).argument
    end
    it "adds landing plane to planes when landed" do
      old_number = airport.planes.length
      airport.has_landed("plane")  # using double
      expect(airport.planes.length).to eq old_number += 1
    end
  end

  describe '#departed' do
    it "respond to departed" do
      expect(airport).to respond_to(:departed).with(1).argument
    end
    it "deletes departed plane from planes when departed" do
      airport.has_landed("plane") # must be an plane on the airport
      old_number = airport.planes.length
      airport.departed("plane") # using double
      expect(airport.planes.length).to eq old_number -= 1
    end
  end


end
