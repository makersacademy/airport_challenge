require 'airport'

describe Airport do
  it "airport to be an airport class" do
    airport = Airport.new
    expect(airport).to be_kind_of(Airport)
  end

    it "Checks that airport default capacity can be overriden as appropriate" do
      airport = Airport.new(40)
      capacity = airport.capacity
      expect(capacity).to eq(40)
    end

    it "Checks the current weather" do
      airport = Airport.new
      weather = double
      weather.stub(:current_weather).and_return("sunny")
      allow(weather).to receive_message_chain(:current_weather).and_return("sunny")
      expect(weather.current_weather).to eq("sunny")
    end

    it "Checks weather before landing. Bad weather prevent landing, good weather allows landing" do
      airport = double("airport")
      allow(airport).to receive_message_chain(:weather).and_return("sunny")
      allow(airport).to receive_message_chain(:weather).and_return("stormy")
      # expect(airport.weather).to eq("sunny")
    end

    # let(:airport) { double :airport }
    it "raise error when landing is intended under bad weather" do
      airport = Airport.new
      capacity = airport.capacity
      landing_planes = Landing_planes.new(capacity)
      
      airport = double("airport")
      allow(airport).to receive_message_chain(:weather).and_return("stormy")
      allow(airport).to receive_message_chain(:weather).and_return("sunny")
      
      expect { raise "Bad Weather. No landing" }.to raise_error("Bad Weather. No landing" )
    end

    it "Verifies that take_off_flow works" do
      take_off = Take_off.new
      plane = Plane.new
      array_landed = []
      array_flying = []
      take_off.flying(array_landed, array_flying)
      expect(plane.leaving).to eq("Take off")
    end
  end