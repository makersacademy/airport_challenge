require "air_traffic_controller"

describe Air_Traffic_Controller do
  describe "#instruct_plane_to_land" do
    it "Returns a success message if plane was able to land" do
      weather_service = double("weather_service")
      airport = double("airport", :is_full? => false, :weather => "sunny")
      plane = double("plane", :land => "Plane landed successfully at airport")
      expect(subject.instruct_plane_to_land(airport, plane, weather_service)).to eq("Plane landed successfully at airport")
    end
    it "Prevents landing if the airport's weather is stormy" do
      weather_service = double("weather_service")
      airport = double("airport", :is_full? => true, :weather => "stormy")
      plane = double("plane")
      expect(subject.instruct_plane_to_land(airport, plane, weather_service)).to eq("Planes unable to land as airport weather is stormy")
    end
  end
  describe "#instruct_plane_to_take_off" do
    it "Returns a success message if plane was able to take off" do
      weather_service = double("weather_service")
      airport = double("airport", :weather => "sunny")
      plane = double("plane", :take_off => "Plane took off successfully from airport")
      expect(subject.instruct_plane_to_take_off(airport, plane, weather_service)).to eq("Plane took off successfully from airport")
    end
    it "Prevents takeoff if the weather is stormy" do
      weather_service = double("weather_service")
      airport = double("airport", :weather => "stormy")
      plane = double("plane")
      expect(subject.instruct_plane_to_take_off(airport, plane, weather_service)).to eq("Planes unable to take off as airport weather is stormy")
    end
  end
end
