require 'controller'
# As an air traffic controller
# To ensure safety
# I want to prevent landing when the airport is full

describe Controller do
  context "tests around capacity" do
    it "can set an airport to be full" do
      airport = double("airport", :full => false, :full? => true)
      weather = double("weather")
      controller = Controller.new(airport, weather)
      controller.capacity_reached
      expect(controller.airport).to be_full
    end
  end
  context "tests around landing permission" do
    it "can determine that landing is permissible if weather ok and airport has capacity" do
      weather = double("weather", :weathers => [:fine], :stormy? => false)
      airport = double("airport", :full => false, :full? => false)
      controller = Controller.new(airport, weather)
      expect(controller.landing_enabled).to eq true
    end
    it "can determine if landing is not permissible if its stormy" do
      weather = double("weather", :weathers => [:stormy], :stormy? => true)
      airport = double("airport", :full => false)
      controller = Controller.new(airport, weather)
      expect(controller.landing_enabled).to eq false
    end
    it "can determine if landing is not permissible if airport is full" do
      weather = double("weather", :weathers => [:fine], :stormy? => false)
      airport = double("airport", :full => true, :full? => true)
      controller = Controller.new(airport, weather)
      expect(controller.landing_enabled).to eq false
    end
  end
end
