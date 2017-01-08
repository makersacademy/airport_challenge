require 'traffic_controller'

describe Controller do
  subject(:controller) { described_class.new }

  describe 'instruct_landing' do
    it 'controller instructs for takeoff only a plane with fly status true' do
      message = "The plane is already flying"
      expect {controller.instruct_takeoff(Plane.new, Airport.new)}.to raise_error(message)
    end
    it 'controller releases a plane and changes it fly status to true' do
      plane = Plane.new(false)
      port = Airport.new
      port.land(plane)
      weather = instance_double("Weather")
      allow(weather).to receive(:stormy).and_return(false)
      expect(controller.instruct_takeoff(plane,port,weather)).to eq(true)
      expect(plane.status).to eq(true)
    end
    it 'prevent takeoff when the weather is stormy' do
      plane = Plane.new(false)
      port = Airport.new
      port.land(plane)
      weather = instance_double("Weather")
      allow(weather).to receive(:stormy).and_return(true)
      message = "Due to adverse weather conditions an airpot is closed for takeoff"
      expect{controller.instruct_takeoff(plane,port,weather)}.to raise_error(message)
      expect(plane.status).to eq(false)
    end
  end

  describe 'instruct_takeoff' do
    it 'controller instructs for landing only a plane with fly status flase' do
      message = "The plane has already landed"
      expect {controller.instruct_landing(Plane.new(false), Airport.new)}.to raise_error(message)
    end
    it 'controller accepts a plane and changes it fly status to false' do
      plane = Plane.new
      port = Airport.new
      weather = instance_double("Weather")
      allow(weather).to receive(:stormy).and_return(false)
      expect(controller.instruct_landing(plane, port, weather)).to eq(true)
      expect(plane.status).to eq(false)
    end
    it 'prevent landing when the weather is stormy' do
      plane = Plane.new
      port = Airport.new
      weather = instance_double("Weather")
      allow(weather).to receive(:stormy).and_return(true)
      message = "Due to adverse weather conditions an airpot is closed for landing"
      expect{controller.instruct_landing(plane, port, weather)}.to raise_error(message)
      expect(plane.status).to eq(true)
    end
  end
end
