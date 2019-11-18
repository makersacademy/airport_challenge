require 'plane'
require 'airport'
require 'weather_spec'

describe Plane do 

  let(:plane) { Plane.new }
  let(:airport) { Airport.new }

  it "should initialize with the plane not being airborn" do
    expect(plane.airborn).to eq(false)
  end

  it "shouldn't be airborn when in the hanger" do
    allow(airport).to receive(:stormy?).and_return(false)
    airport.hanger = [plane]
    expect(plane.airborn).to be_falsey
  end

  it "should be airborn if it takes off successfully from the airport" do
    allow(airport).to receive(:stormy?).and_return(false)
    airport.land(plane)
    airport.take_off(plane)
    expect(plane.airborn).to be_truthy
  end

  describe '#in_the_air' do

    it "should be airborn when in the air is called" do 
      plane.in_the_air
      expect(plane.airborn).to be_truthy
    end

  end 

  describe '#landed' do

    it "should not be airborn when landed is called" do 
      plane.landed
      expect(plane.airborn).to be_falsey
    end

  end
end
