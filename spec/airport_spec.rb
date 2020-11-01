require 'airport'

describe Airport do

  it "overrides airport capacity when asked to" do
    airport = Airport.new(15)
    expect(airport.capacity).to eq(15)
  end

  describe "#inbound_flight" do
    it "responds to inbound_flight" do
      expect(subject).to respond_to(:inbound_flight).with(1).argument
    end

    it "appends the incoming plane to landed planes" do
      plane = Plane.new
      plane.land(subject)
      expect(subject.landed_planes[-1]).to eq(plane)
    end

    it "raises an Exception when trying to land at a full airport" do
      subject.capacity.times { Plane.new.land(subject) }
      expect { subject.inbound_flight(Plane.new) }.to raise_error(Exception, "Landing denied - Airport in full capacity")
    end
  end

  describe "#outbound_flight" do
    it "responds to the outbound_flight method" do
      expect(subject).to respond_to(:outbound_flight).with(1).argument
    end

    it "removes a plane from the landed_planes list based on plane number" do
      plane = Plane.new
      plane.land(subject)
      expect(subject.outbound_flight(plane)).to eq(plane)
    end
  end

  describe "#confirm_takeoff" do
    it "responds to the confirm method" do
      expect(subject).to respond_to(:confirm_takeoff).with(1).argument
    end

    it "confirms the absence of a plane" do
      plane = Plane.new
      airport = Airport.new
      plane.land(airport)
      subject.outbound_flight(plane)
      expect(subject.confirm_takeoff(plane)).to eq("Plane #{plane} is not at the airport.")
    end

  end

end
