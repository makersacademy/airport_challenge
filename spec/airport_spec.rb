require 'airport'

describe Airport do

  it {is_expected.to respond_to(:landing_bay)}

  it "initializes with a landing bay that is an array" do
    expect(subject.landing_bay).to be_a Array
  end

  it "should initialize with a landing bay that is empty" do
    expect(subject.landing_bay).to be_empty
  end

  it { is_expected.to respond_to(:land_plane).with(1).argument }

  describe "#land_plane" do

    it "should park a plane in the empty landing bay and that plane should have a landed status" do
      plane = Plane.new
      airport = Airport.new
      landing_bay = airport.land_plane(plane)
      expect(landing_bay.count).to eq 1
      expect(landing_bay[0].landed_status).to eq "Landed"
    end

    it "should park many planes in the airport's landing bay" do
      airport = Airport.new
      #land 20 planes at the one airport
      expect(20.times {airport.land_plane(Plane.new)}).to eq 20
    end

  end

  it { is_expected.to respond_to(:take_off) }

  describe "#take_off" do

    it "should allow a plane to take off" do
      airport = Airport.new
      #land 20 planes at the one airport
      x = 20
      x.times {airport.land_plane(Plane.new)}
      #note: planes will take_off on a FIFO time-basis (to be checked with client)
      expect(airport.take_off).to eq "Airbourne"
    end

  end


end
