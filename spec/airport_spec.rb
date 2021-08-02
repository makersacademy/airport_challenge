require "airport"

describe Airport do  
  let(:plane) { double :plane }
  let(:weather) { double :weather }
  
  context "when weather is good" do
    before do
      allow(weather).to receive(:weather_report).and_return :good_weather
    end

    it "has room for planes to land" do
      expect(subject.hanger).to eq []
    end
  
    it "has a default capacity" do
      expect(subject.capacity).to eq 1
    end
  
    it "can be given a custom capacity" do 
      test_airport = Airport.new(42)
      expect(test_airport.capacity).to eq 42
    end
  
    it "accepts landings with #land" do
      expect(subject).to respond_to :land
    end
  
    it "allows 1 plane to land at a time" do
      expect(subject).to respond_to(:land).with(1).argument
    end
  
    it "does not allow a plane to land if hanger is full" do 
      disused_airport = Airport.new(0)
      expect { disused_airport.land(plane) }.to raise_exception("Can't land, airport is full.")
      expect(disused_airport.hanger.length).to eq 0
    end
  
    it "raises an exception if no plane is specified for landing" do
      expect { subject.land() }.to raise_exception(ArgumentError)
    end
  
    it "allows a plane to #take_off" do
      expect(subject).to respond_to :take_off
    end
  
    it "allows 1 plane to take off at a time" do
      expect(subject).to respond_to(:take_off).with(1).argument
    end
  
    it "removes a plane from it's hanger when plane takes off" do
      subject.land(plane)
      allow(plane).to recieve(:update_location).and_return(:air)
      allow(subject).to receive(:check_weather_report).and_return(:good_weather)
      expect(subject.take_off(plane)).to eq plane
      expect(subject.hanger).to eq []
    end
  
    it "raises an exception if no plane is specified for take off" do
      expect { subject.take_off() }.to raise_error(ArgumentError)
    end
  end

  context "when weather is bad" do
    before do
      allow(weather).to receive(:weather_report).and_return :bad_weather
    end

    it "does not allow take off" do
      allow(weather).to receive(:weather_report).and_return :bad_weather
      subject.land(plane)
      allow(subject).to receive(:check_weather_report) .and_return(:bad_weather)
      p subject.weather
      expect { subject.take_off(plane) }.to raise_error("It's too stormy to take off")
    end
  
    # it "does not allow landing when weather is bad" do
    #   test_plane = Plane.new
    #   good_weather = double('weather') 
    #   allow(good_weather).to receive(:check_weather_report) { :good_weather } 
    #   expect { subject.land(test_plane) }.to raise_exception("It's too stormy to land")
    # end
  end
  
end
