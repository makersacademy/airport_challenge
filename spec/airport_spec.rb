require './lib/airport.rb'
require './lib/plane.rb'

describe Airport do

  before do
    @airport = Airport.new
  end

  let (:plane) {double :plane}

  it { is_expected.to respond_to :take_off }

  it { is_expected.to respond_to :landing }

  it "Should have a capacity of 15 when given" do
    @airport = Airport.new(15)
    expect(@airport.capacity).to eq 15
  end

  it "Should have a default capacity of 20" do
    expect(@airport.capacity).to eq Airport::DEFAULT_CAPACITY
  end

    describe "Landing related elements of brief"

      before do
        @plane = Plane.new
        allow(@airport).to receive(:stormy?).and_return false
      end

      it "Should allow a plane to land" do
        expect(@airport).to receive(:landing)
        @airport.landing(@plane)
      end

      it "Should show that a plane has landed" do
        expect(@airport.landing(@plane)).to eq [@plane]
      end

      it "Should allow 15 planes to land" do
        15.times{@airport.landing(Plane.new)}
        expect(@airport.planes.count).to eq 15
      end

      it "Should not allow a plane to land if it's stormy" do
        allow(@airport).to receive(:stormy?).and_return true
        expect{@airport.landing(@plane)}.to raise_error("It's too windy to land!")
      end

      it "Should not allow planes to land if at default capacity" do
        Airport::DEFAULT_CAPACITY.times{@airport.landing(Plane.new)}
        expect { @airport.landing(@plane)}.to raise_error("There's no room to land this plane!")
      end

    describe "Take-off related elements of the brief"

      it "Should allow a plane to take off" do
        expect(@airport).to receive(:take_off)
        @airport.take_off
      end

      it "Should not allow a plane to take off if there aren't any planes" do
        expect{@airport.take_off}.to raise_error("There aren't any planes!")
      end

      before do
        @plane = Plane.new
      end

      it "Should see that a plane has left the airport" do
        @airport.landing(@plane)
        expect(@airport.take_off).to eq @plane
      end

      it "Should not allow a plane to take off it it's stormy" do
        @airport.landing(@plane)
        allow(@airport).to receive(:stormy?) { :stormy }
        expect{@airport.take_off}.to raise_error("It's blowing a gale out there!")
      end

      it "Should get a plane, and check it's working" do
        expect(@plane.working?).to eq true
      end

end
