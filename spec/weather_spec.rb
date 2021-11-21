require 'weather'

describe Weather do

    it "Can return the weather when asked" do
        controller = Controller.new
        expect(controller).to respond_to :weather?
    end

    it "Will return one of clear or stormy " do
        weather = Controller.new
        expect(weather.weather?).to eq("Stormy").or eq("Clear")
    end

    it "Will return one of these randomly with 5% chance to be stormy" do
        weather = Controller.new
        past_weather = []
        10000.times {past_weather << weather.weather?}
        expect(past_weather.count("Stormy")).to be < 1000
    end

    it "If the weather is stormy, the landing will be refused" do
        controller = Controller.new
        plane = Plane.new
        controller.stub(:weather?).and_return("Stormy")
        expect(lambda {controller.request_landing(plane)}).to raise_error
    end

    it "If the weather is clear, the landing will be accepted" do
        controller = Controller.new
        plane = Plane. new
        controller.stub(:weather?).and_return("Clear")
        expect(lambda {controller.request_landing(plane)}).not_to raise_error
    end

    it "If the weather is stormy, a take off will be refused" do
        controller = Controller.new
        plane = Plane.new
        controller.stub(:weather?).and_return("Clear")
        controller.request_landing(plane)
        controller.stub(:weather?).and_return("Stormy")
        expect(lambda {controller.request_take_off(plane)}).to raise_error
    end

    it "If the weather is clear, a take off will be accepted" do
        controller = Controller.new
        plane = Plane.new
        controller.stub(:weather?).and_return("Clear")
        controller.request_landing(plane)
        expect(lambda {controller.request_take_off(plane)}).not_to raise_error
    end

end