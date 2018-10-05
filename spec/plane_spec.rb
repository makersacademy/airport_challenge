require 'airport'
require 'pry'

describe Plane do
  let(:plane) { subject }
  let(:airport) { Airport.new }

  it "has a location" do
    expect(plane.location).not_to be_nil
  end

  describe "#land" do

    context "plane is able to land" do
      before { airport.weather = "sunny"}
      before { plane.land(airport) }

      it { should respond_to(:land).with(1).argument }
      it "should update its location upon landing" do
        expect(plane.location).to eq(airport)
      end
      it "should update airport's planes upon landing" do
        expect(airport.planes).to include(plane)
      end
    end

    context "plane cannot land" do

      it "cannot land if airport is full" do
        airport.weather = "sunny"
        5.times { Plane.new.land(airport) }
        expect{plane.land(airport)}.to raise_error("Airport is full!")
      end

      it "doesn't land in a storm" do
        airport.weather = "stormy"
        expect { plane.land(airport) }.to raise_error("Can't land - too stormy!")
      end
    end

  end


  describe "#take_off" do
    context "when it is sunny" do

      before { airport.weather = "sunny"}
      before { plane.take_off(airport) }

      it { should respond_to(:take_off).with(1).argument }

      it "should update its location upon take-off" do
        expect(plane.location).to eq("sky")
      end

      it "should update airport's planes upon take-off" do
        expect(airport.planes).not_to include(plane)
      end
    end

    context "when it is stormy" do
      before { airport.weather = "stormy" }

      it "doesn't take off in a storm" do
        expect { plane.land(airport) }.to raise_error("Can't land - too stormy!")
      end
    end
  end

  describe "#in?" do
    it { should respond_to(:in?).with(1).argument }
  end
end
