# Task https://github.com/pchan2/airport_challenge
require 'airport'

describe Airport do
  it "instructs a plane to land at the airport" do
    plane = Plane.new
    expect(subject.land plane).to eq true
  end

  it "instructs a plane to take off from the airport" do
    expect(subject.take_off).to eq false
  end

  it "confirms a plane is no longer at the airport after takeoff" do
    subject.take_off
    expect(subject.at_airport?).to eq false
  end

  it "prevents landing when airport is full" do
    Airport::DEFAULT_CAPACITY.times do
      subject.land Plane.new
    end
    expect { subject.land Plane.new }.to raise_error "Airport full"
  end

  it "prevents takeoff when stormy" do
    subject.check_weather('stormy')
    expect { subject.take_off }.to raise_error "Takeoff prevented due to storm"
  end
end
