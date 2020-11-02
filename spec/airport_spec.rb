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
      allow(subject.airport_weather).to receive(:request_weather) {"sunny"}
      plane.land(subject)
      expect(subject.landed_planes[-1]).to eq(plane)
    end

    it "raises an Exception when trying to land at a full airport" do
      plane = Plane.new
      airport = Airport.new(1)
      allow(airport.airport_weather).to receive(:request_weather) {"sunny"}
      plane.land(airport)
      expect { (Plane.new).land(airport) }.to raise_error(Exception, "Landing denied - Airport in full capacity")
    end

    it "raises an exception when trying to land and weather is stormy" do
      allow(subject.airport_weather).to receive(:request_weather) {"stormy"}
      expect { subject.inbound_flight(Plane.new) }.to raise_error(Exception, "Landing denied due to stormy weather.")
    end

  end

  describe "#outbound_flight" do
    it "responds to the outbound_flight method" do
      expect(subject).to respond_to(:outbound_flight).with(1).argument
    end

    it "removes a plane from the landed_planes list based on plane number" do
      plane = Plane.new
      allow(subject.airport_weather).to receive(:request_weather) {"sunny"}
      plane.land(subject)
      expect(subject.outbound_flight(plane)).to eq(plane)
    end

    it "raises an exception when trying to take off and weather is stormy" do
      allow(subject.airport_weather).to receive(:request_weather) {"stormy"}
      expect { subject.outbound_flight(Plane.new) }.to raise_error(Exception, "Take off denied due to stormy weather.")
    end
    # 
    # it "raises an exception when trying to take off but plane is not present at the airport" do
    #   allow(subject).to receive(:landed_planes) { 0 }
    #   allow(subject.airport_weather).to receive(:request_weather) {"sunny"}
    #   expect { subject.outbound_flight(Plane.new) }.to raise_error(Exception, "Take off denied as plane is not at the airport")
    # end

  end

end
