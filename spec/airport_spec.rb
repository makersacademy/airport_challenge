require "airport"

describe Airport do
  subject(:airport) { described_class.new(50) }
  let(:plane) { Plane.new }

  describe "#landing" do
    it "instructs plane to land" do
      expect(airport).to respond_to(:land).with(1).argument
    end

    it "does not allow landing when airport is full" do
      50.times do
        airport.land(plane)
      end
      expect { airport.land(plane) }.to raise_error 'Airport Full - Cannot Land'
    end
  end

  describe "#takeoff" do
    it "instructs plane to take off" do
      expect(airport).to respond_to(:take_off).with(1).argument
    end
    
  end
end
