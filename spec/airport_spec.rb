require "airport.rb"

describe Airport do

  it "responds to .landing" do
    expect(subject).to respond_to(:landing)
  end

  it ".landing responds to 1 argument" do
    expect(subject).to respond_to(:landing).with(1).argument
  end

  it "allows a plane to take-off, and returns confirmation that it is no longer in the airport" do
    plane = Plane.new
    expect_any_instance_of(Airport).to receive(:weather_check) { "Sunny" }
    Airport.new.take_off(plane)
    expect(plane.location).to eq("Flying")
  end

  it "'Sunny' -  allows take off" do
    expect_any_instance_of(Airport).to receive(:weather_check) { "Sunny" }
    expect(subject.take_off(Plane.new)).to eq "You're clear for take off"
  end

  it "'Stormy' - disallows take off" do
    expect_any_instance_of(Airport).to receive(:weather_check) { "Stormy" }
    expect { subject.take_off(Plane.new) }.to raise_error "You're not cleared for take off due to adverse weather conditions"
  end

  it "'Sunny' - allowed landing" do
    expect_any_instance_of(Airport).to receive(:weather_check) { "Sunny" }
    expect(subject.landing(Plane.new)).to eq "You're clear for landing"
  end

  it "'Stormy' - disallows landing" do
    expect_any_instance_of(Airport).to receive(:weather_check) { "Stormy" }
    expect { subject.landing(Plane.new) }.to raise_error "You're not cleared for landing due to adverse weather conditions"
  end

  it "confirms that the default landing capacity is 20" do
    airport = Airport.new
    expect(airport.capacity).to eq 20
  end

  it "confirms that the default landing capacity can be overwridden" do
    airport = Airport.new(30)
    expect(airport.capacity).to eq 30
  end

  it "confirms that the plane has landed at the airport (via name storage)" do
    plane = Plane.new
    airport = Airport.new
    expect_any_instance_of(Airport).to receive(:weather_check) { "Sunny" }
    airport.landing(plane)
    expect(airport.planes[0].to_s).to eq plane.name
  end

  it "checks to ensure the same plane cannot land twice" do
    plane = Plane.new
    airport = Airport.new
    expect_any_instance_of(Airport).to receive(:weather_check) { "Sunny" }
    airport.landing(plane)
    expect { airport.landing_procedure(plane) }.to raise_error "You've already landed"
  end

  it "checks the take_off_procedure functions to change the planes location to Plane.in_the_sky" do
    plane = Plane.new
    airport = Airport.new
    expect_any_instance_of(Airport).to receive(:weather_check) { "Sunny" }
    airport.take_off(plane)
    expect(plane.location).to eq("Flying")
  end

  it "prevents landing at the airport if the airport is full" do
    planeA = Plane.new
    planeB = Plane.new
    airport = Airport.new(1)
    expect_any_instance_of(Airport).to receive(:weather_check) { "Sunny" }
    airport.landing(planeA)
    expect { airport.landing_procedure(planeB) }.to raise_error "Airport is at max capacity"
  end

  it "checks if the plane is already in the air when taking_off" do
    plane = Plane.new
    airport = Airport.new
    expect_any_instance_of(Airport).to receive(:weather_check) { "Sunny" }
    airport.take_off(plane)
    expect { airport.take_off_procedure(plane) }.to raise_error "You're already in the air"
  end

  it "does a weather_check and produces either Stormy OR | Sunny" do
    expect(subject.weather_check).to eq("Stormy").or eq("Sunny")
  end

end
