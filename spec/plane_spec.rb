require 'airport'

describe Plane do
  let(:plane) { subject }
  let(:airport) { Airport.new }

  it "has a location" do
    expect(plane.location).not_to be_nil
  end

  context "it lands" do
    before { plane.land(airport) }
    
    it { should respond_to(:land).with(1).argument }

    it "should update its location upon landing" do
      expect(plane.location).to eq(airport)
    end

    it "should update airport's planes upon landing" do
      expect(airport.planes).to include(plane)
    end
  end

  context "it takes off" do
    it { should respond_to(:take_off).with(1).argument }
  end

  context "can check if it's in an airport" do
    it { should respond_to(:in?).with(1).argument }
  end
end
