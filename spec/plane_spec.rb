require 'plane'
require 'airport'
require 'weather'

describe Plane do
  before do
    @airport = Airport.new
    @plane = Plane.new
  end
  
    
  it { is_expected.to respond_to(:land_plane) }
  it { is_expected.to respond_to(:take_off) }
  it { is_expected.to respond_to(:check_weather) }

  it "plane lands at an airport and is now located in the airport" do
    allow_any_instance_of(Weather).to receive(:check).and_return("Clear")
    @plane.land_plane(@airport)
    expect(@plane.location).to eq @airport
  end

  it "plane takes off from airport and is no longer in airport" do
    allow_any_instance_of(Weather).to receive(:check).and_return("Clear")
    @plane.land_plane(@airport)
    @plane.take_off(@airport)
    expect(@plane.location).to eq nil
  end

  it "plane does not land at airport if airport is full" do
    allow_any_instance_of(Weather).to receive(:check).and_return("Clear")
    @plane.land_plane(@airport)
    new_plane = Plane.new
    expect { new_plane.land_plane(@airport) }.to raise_error("PLANE NO")
  end

  it "plane does not land at airport if airport is full and capcity has been changed" do
   @airport.change_capacity(4)
    allow_any_instance_of(Weather).to receive(:check).and_return("Clear")
    4.times do
      Plane.new.land_plane(@airport)
    end
    expect { @plane.land_plane(@airport) }.to raise_error("PLANE NO")
  end

  it "a plane that has landed can not land again" do
    allow_any_instance_of(Weather).to receive(:check).and_return("Clear")
    @plane.land_plane(@airport)
    expect { @plane.land_plane(@airport) }.to raise_error("this plane has landed already!")
  end

  it "a plane that is flying can not take off again" do
    allow_any_instance_of(Weather).to receive(:check).and_return("Clear")
    @plane.land_plane(@airport)
    @plane.take_off(@airport)
    expect { @plane.take_off(@airport) }.to raise_error("this plane is flying already!")
  end

  it "a plane can not take off from airports they're not in" do
    allow_any_instance_of(Weather).to receive(:check).and_return("Clear")
    second_airport = Airport.new
    @plane.land_plane(@airport)
    expect { @plane.take_off(second_airport).to raise_error("you are not at this airport") }
  end

  it "plane can't land if there is stormy weather" do
    allow_any_instance_of(Weather).to receive(:check).and_return("Stormy")
    expect { @plane.land_plane(@airport) }.to raise_error("Stormy! Plane GO AWAY!")
  end

  it "plane can't take off if there is stormy weather" do
    @plane.land_plane(@airport)
    allow_any_instance_of(Weather).to receive(:check).and_return("Stormy")
    expect { @plane.take_off(@airport) }.to raise_error("Stormy! Plane STAY!")
  end


end
