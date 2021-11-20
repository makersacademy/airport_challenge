require "controller"

describe Controller do

    it "The controller can request a landing" do
        controller = Controller.new
        expect(controller).to respond_to :request_landing
    end

    it "The controller can request a take-off" do
        controller = Controller.new
        expect(controller).to respond_to :request_take_off
    end

    it "The controller can request a plane lands at the airport" do
        controller = Controller.new
        plane = Plane.new
        controller.request_landing(plane)
        expect(controller.airport.storage).to include(plane)
    end

    it "The controller can request a plane takes off at the airport" do
        controller = Controller.new
        plane = Plane.new
        controller.airport.storage << plane
        controller.request_take_off(plane)
        expect(controller.airport.storage).not_to include(plane)
    end

    it "A plane the controller has requested land confirms it has landed" do
        controller = Controller.new
        plane = Plane.new
        controller.request_landing(plane)
        expect(plane.in_air).to eq false
    end

    it "A plane the controller has requested take off confirms it has taken off" do
        controller = Controller.new
        plane = Plane.new
        controller.airport.storage << plane
        controller.request_take_off(plane)
        expect(plane.in_air).to eq true
    end


    it "A plane cannot land at a full airport" do
        controller = Controller.new
        20.times {controller.request_landing(Plane.new)}
        plane = Plane.new
        expect{controller.request_landing(plane)}.to raise_error
    end

end