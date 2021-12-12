require 'plane'
require 'airport'

describe Plane do
    
  it { is_expected.to respond_to(:land_plane) }
  it { is_expected.to respond_to(:take_off) }
  it { is_expected.to respond_to(:check_weather) }

  it "plane lands at an airport, when called to" do
    plane = Plane.new
    airport = Airport.new
    allow(plane).to receive(:check_weather) { "Clear" }
    expect(plane.land_plane(plane, airport)).to include(plane)
  end

  it "plane takes off from airport and is no longer in airport" do
    plane = Plane.new
    airport = Airport.new
    allow(plane).to receive(:check_weather) { "Clear" }
    expect(plane.take_off(plane, airport)).not_to include(plane)
  end

  it "plane does not land at airport if airport is full" do
    plane = Plane.new
    airport = Airport.new
    allow(plane).to receive(:check_weather) { "Clear" }
    plane.land_plane(plane, airport)
    expect { plane.land_plane(plane, airport) }.to raise_error("PLANE NO")
  end

  it "plane does not land at airport if airport is full and capcity has been changed" do
    plane = Plane.new
    airport = Airport.new
    airport.change_capacity(4)
    allow(plane).to receive(:check_weather) { "Clear" }
    4.times { plane.land_plane(plane, airport) }
    expect { plane.land_plane(plane, airport) }.to raise_error("PLANE NO")
  end

  it "plane can't land if there is stormy weather" do
    plane = Plane.new
    airport = Airport.new
    allow(plane).to receive(:check_weather) { "Stormy" }
    expect { plane.land_plane(plane, airport) }.to raise_error("Stormy! Plane GO AWAY!")
  end

  it "plane can't take off if there is stormy weather" do
    plane = Plane.new
    airport = Airport.new
    allow(plane).to receive(:check_weather) { "Stormy" }
    expect { plane.take_off(plane, airport) }.to raise_error("Stormy! Plane STAY!")
  end

  it "a plane that has landed can not land again" do
    plane = Plane.new
    airport = Airport.new
    plane.land_plane(plane, airport)
    expect { plane.land_plane(plane, airport) }.to raise_error("this plane has landed already!")
  end

  it "a plane that is flying can not take off again" do
    plane = Plane.new
    airport = Airport.new
    plane.take_off(plane, airport)
    expect { plane.take_off(plane, airport) }.to raise_error("this plane is flying already!")
  end

end