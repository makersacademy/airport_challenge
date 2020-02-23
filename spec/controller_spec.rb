require "controller"

describe TrafficController do

  describe "#instruct_to_land" do
    it "Instructs plane to land on the airport" do
      plane = double("plane", :land => "Plane successfully landed on the airport")
      airport = double("airport", :full? => false, :weather => "sunny")
      weather_report = double("weather_report")
      expect(subject.instruct_to_land(plane, airport, weather_report)).to eq("Plane successfully landed on the airport")
    end

    it "Prevents plane from landing when the airport is full" do
      plane = double("plane", :land => "Plane successfully landed on the airport")
      airport = double("airport", :full? => true, :weather => "sunny")
      weather_report = double("weather_report")
      expect(subject.instruct_to_land(plane, airport, weather_report)).to eq("Plane unable to land as the airport is full")
    end

    it "Prevents plane from landing when the weather is stormy" do
      plane = double("plane")
      airport = double("airport", :full? => false, :weather => "stormy")
      weather_report = double("weather_report")
      expect(subject.instruct_to_land(plane, airport, weather_report)).to eq("Plane unable to land as the weather is stormy")

end
  end


end
