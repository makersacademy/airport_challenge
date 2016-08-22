require 'airport'
require 'weather'

describe Airport do

  let(:plane) {double(:plane)}
  let(:good_weather) {double(:good_weather)}
  let(:bad_weather) {double(:bad_weather)}

  before(:each) do
    allow(good_weather).to receive(:stormy?).and_return(false)
    allow(bad_weather).to receive(:stormy?).and_return(true)
  end

  context "#request_land" do

    it "should recognise ability to call 'request_land'" do
      expect(subject).to respond_to(:request_land)
    end

    it "landed plane should then be inside airport" do
      port = Airport.new
      plane = Plane.new
      port.request_land(plane, good_weather)
      expect(port.in_airport).to include(plane)
    end

    it "shows error when to stormy to land" do
      plane = Plane.new
      expect{subject.request_land(plane, bad_weather)}.to raise_error "its to dangerous to do that now"
    end

    it "raises error when airport is full" do
      5.times {subject.request_land(Plane.new, good_weather)}
      expect{subject.request_land(Plane.new, good_weather)}.to raise_error "Airport full"
    end

    it "raises error when request_land is called on plane already landed" do
      plane = Plane.new
      subject.request_land(plane, good_weather)
      expect{subject.request_land(plane, good_weather)}.to raise_error "Plane already landed"
    end
  end


  context "#request_depart" do

    it "should recognise ability to call 'request_depart'" do
      expect(subject).to respond_to(:request_depart)
    end

    it "departed plane should no longer be inside airport" do
      plane = Plane.new
      port = Airport.new
      port.request_land(plane, good_weather)
      port.request_depart(plane, good_weather)
      expect(port.in_airport).not_to include(plane)
    end

    it "shows error when to stormy to take off" do
      plane = Plane.new
      subject.request_land(plane, good_weather)
      expect{subject.request_depart(plane, bad_weather)}.to raise_error "its to dangerous to do that now"
    end

    it "raises error when request_depart is called on plane already in flight" do
      plane = Plane.new
      expect{subject.request_depart(plane, good_weather)}.to raise_error "Plane already in flight"
    end
  end


  describe "capacity" do
    it "should take in custom capacity value" do
      port = Airport.new(10)
      expect(port.capacity).to eq(10)
    end
  end

end
