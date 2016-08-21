require 'airport'

describe Airport do

  before do
    @weather = double(:weather)
    #@plane = double(:plane)
    #allow(@weather).to receive(:stormy?) {true}
  end


  context "#request_land" do

    it "should recognise ability to call 'request_land'" do
      expect(subject).to respond_to(:request_land)
    end

    it "landed plane should then be inside airport" do
      allow(@weather).to receive(:stormy?) {false}
      #@weather.stub(:stormy?).with(false)
      port = Airport.new
      plane = Plane.new
      port.request_land(plane)
      expect(port.in_airport).to include(plane)
    end
  end


  context "#request_depart" do

    it "should recognise ability to call 'request_depart'" do
      expect(subject).to respond_to(:request_depart)
    end

    it "departed plane should no longer be inside airport" do
      plane = Plane.new
      port = Airport.new
      port.request_depart(plane)
      expect(port.in_airport).not_to include(plane)
    end

    it "shows error when to stormy to take off" do
      allow(@weather).to receive(:stormy?) {true}
      plane = Plane.new
      expect(subject.request_depart(plane)).to raise_error "To stormy to take off"
    end
  end

end
