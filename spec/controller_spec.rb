require 'controller'
# As an air traffic controller
# To ensure safety
# I want to prevent landing when the airport is full

describe Controller do

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
  context "tests around takeoff permission" do
    it "can determine that takeoff is permissible if weather ok and there are planes on the ground" do
      weather = double("weather", :weathers => [:fine], :stormy? => false)
      airport = double("airport", :full => false, :full? => false, :empty? => false)
      controller = Controller.new(airport, weather)
      expect(controller.takeoff_enabled).to eq true
    end

    it "can determine that takeoff is not permissible if weather bad" do
      weather = double("weather", :weathers => [:stormy], :stormy? => true)
      airport = double("airport", :full => false, :full? => false)
      controller = Controller.new(airport, weather)
      expect(controller.takeoff_enabled).to eq false
    end
  end

  context "tests around inbound planes," do
    it "should make landing instruction should fail if no inbound planes" do
      weather = double("weather")
      airport = double("airport")
      controller = Controller.new(airport, weather)
      expect { controller.issue_landing_instruction }.to raise_error "No inbound planes"
    end

    it "should make landing instruction should fail if airport closed" do
      weather = double("weather", :weathers => [:stormy], :stormy? => true)
      airport = double("airport")
      planes = [double("planes")]
      controller = Controller.new(airport, weather, planes)
      expect { controller.issue_landing_instruction }.to raise_error "Landing not possible at the moment"
    end

    it "should make landing instruction if all ok" do
      weather = double("weather", :weathers => [:fine], :stormy? => false)
      airport = double("airport", :empty? => true, :full? => false, :land => true)
      planes = [double("planes", :airborne => true)]
      controller = Controller.new(airport, weather, planes)
      expect(controller.planes_inbound.length).to eq 1
      controller.issue_landing_instruction
      expect(controller.planes_inbound.length).to eq 0
    end
  end

  context "tests around outbound planes," do
    it "should not make take_off instruction if airport empty" do
      weather = double("weather", :stormy? => false)
      airport = double("airport", :empty? => true)
      controller = Controller.new(airport, weather)
      expect { controller.issue_takeoff_instruction }.to raise_error "Take off not possible at the moment"
    end

    it "should not make take_off instruction if stormy" do
      weather = double("weather", :stormy? => true)
      airport = double("airport", :empty? => false)
      controller = Controller.new(airport, weather)
      expect { controller.issue_takeoff_instruction }.to raise_error "Take off not possible at the moment"
    end

    it "should make takeoff instruction if all ok" do
      weather = double("weather", :weathers => [:fine], :stormy? => false)
      airport = double("airport", :empty? => false, :full? => false, :takeoff => true, :land => true)
      planes = [double("planes", :airborne => true)]
      controller = Controller.new(airport, weather, planes)
      expect(controller.planes_inbound.length).to eq 1
      controller.issue_landing_instruction
      expect(controller.planes_inbound.length).to eq 0
      expect(controller.planes_outbound.length).to eq 0
      controller.issue_takeoff_instruction
      expect(controller.planes_outbound.length).to eq 1
    end
  end

end
