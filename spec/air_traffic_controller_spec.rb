require 'airport'
require 'plane'
require 'air_traffic_controller'
describe Air_traffic_controller do
  it "returns an instance of Air_traffic_controller" do
    expect(subject).to be_an_instance_of(Air_traffic_controller)
  end
  it "responds to land" do
    expect(subject).to respond_to(:land)
  end
  it "responds to take_off" do
    expect(subject).to respond_to(:take_off)
  end

  it "raises an error when plane is trying to land and the weather is stormy" do
    atc = Air_traffic_controller.new
    london_city = Airport.new(50, "LCY")
    easyjet_plane = Plane.new("FCO")
    allow(london_city).to receive(:get_weather).and_return(:stormy)
    expect { atc.land(london_city, easyjet_plane) }.to raise_error(RuntimeError, "The plane cannot land because of the stormy weather")
  end 

  it "raises an error when plane is trying to land and the airport is full" do
    atc = Air_traffic_controller.new
    london_city = Airport.new(50, "LCY")
    easyjet_plane = Plane.new("FCO")
    london_city.actual_capacity = 50
    allow(london_city).to receive(:get_weather).and_return(:sunny)
    expect { atc.land(london_city, easyjet_plane) }.to raise_error(RuntimeError, "The airport is full")
  end 

  it "raises an error when planen is trying to land in the wrong airport " do
    atc = Air_traffic_controller.new
    london_city = Airport.new(50, "LCY")
    easyjet_plane = Plane.new("LCY")
    easyjet_plane.is_flying = true
    allow(london_city).to receive(:get_weather).and_return(:sunny)
    expect { atc.land(london_city, easyjet_plane) }.to raise_error RuntimeError
  end

  it "returns true when the plane is trying to land" do
    atc = Air_traffic_controller.new
    london_city = Airport.new(50, "LCY")
    easyjet_plane = Plane.new("FCO")
    easyjet_plane.is_flying = true
    allow(london_city).to receive(:get_weather).and_return(:sunny)
    expect(atc.land(london_city, easyjet_plane)).to be true
  end
  it " raises an error when plane is trying to take_off when the weather is stormy" do
    atc = Air_traffic_controller.new
    london_city = Airport.new(50, "LCY")
    easyjet_plane = Plane.new("LCY")
    allow(london_city).to receive(:get_weather).and_return(:stormy)
    expect { atc.take_off(london_city, easyjet_plane) }.to raise_error(RuntimeError, "The plane cannot take_off because of the stormy weather")
  end
  it "raises an error when plane wants to take off from the wrong airport " do
    atc = Air_traffic_controller.new
    london_city = Airport.new(50, "LCY")
    easyjet_plane = Plane.new("FCO")
    easyjet_plane.is_flying = false
    allow(london_city).to receive(:get_weather).and_return(:sunny)
    expect { atc.take_off(london_city, easyjet_plane) }.to raise_error(RuntimeError, "Location must be wrong")
  end
  it "return true when the plane is trying to take_off" do
    atc = Air_traffic_controller.new
    london_city = Airport.new(50, "LCY")
    easyjet_plane = Plane.new("LCY")
    easyjet_plane.is_flying = false
    allow(london_city).to receive(:get_weather).and_return(:sunny)
    expect(atc.take_off(london_city, easyjet_plane)).to be true
  end 
  it "returns true when the plane is trying to take_off" do
    atc = Air_traffic_controller.new
    london_city = Airport.new(50, "LCY")
    easyjet_plane = Plane.new("LCY")
    easyjet_plane.is_flying = false
    allow(london_city).to receive(:get_weather).and_return(:sunny)
    expect(atc.take_off(london_city, easyjet_plane)).to be true
  end 
  it "raises an error when plane wants to take off but it is already flyingt " do
    atc = Air_traffic_controller.new
    london_city = Airport.new(50, "LCY")
    easyjet_plane = Plane.new("LCY")
    easyjet_plane.is_flying = true
    allow(london_city).to receive(:get_weather).and_return(:sunny)
    expect { atc.take_off(london_city, easyjet_plane) }.to raise_error(RuntimeError, "The plane is already flying")
  end
end
