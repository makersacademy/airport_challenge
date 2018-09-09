require 'airplane'
require 'airport'
require 'weather'

describe Airport do
  it "doesn't raise error when creating airport" do
    expect { subject }.not_to raise_error
  end

  it "expects airports to be able to taken in an argument, such as plane" do
    expect(subject).to respond_to(:land).with(1).argument
  end

  it "expects airport to have a list for many planes" do
    expect(subject.plane_hanger).to eq []
  end

  it "expects list of planes to contain planes that have landed" do
    plane = Airplane.new
    subject.land(plane)
    expect(subject.plane_hanger).not_to be_empty
  end

  it "expects that when plane takes off, it is no longer at the airport" do
    plane = Airplane.new
    subject.land(plane)
    expect(subject.take_off(plane)).to eq plane
  end

  it "should not let planes take off if the weather is stormy" do
    airport = Airport.new
    plane = Airplane.new
    airport.land(plane)
    airport.weather(Weather.new.stormy)
    expect { airport.take_off(plane) }.to raise_error "Sorry, there's a storm."
  end

  it "should not let planes land if the weather at airport is stormy" do
    plane = double(:Airplane)
    weather = double(:Weather, stormy: "Stormy")
    subject.weather(weather.stormy)
    expect { subject.land(plane) }.to raise_error "Sorry, there's a storm."
  end

  it "should not let more planes land if the airport has reached it's capacity" do
    subject.default_capacity.times { subject.land(Airplane.new) } 
    expect { subject.land(Airplane.new) }.to raise_error "Sorry, the hanger is full."
  end

  it "can't land airplane at another airport if it has already landed" do
    heathrow = subject
    gatwick = subject
    canadian_plane = Airplane.new
    heathrow.land(canadian_plane)
    expect { gatwick.land(canadian_plane) }.to raise_error "Sorry, this plane already landed at another airport."

  end 
end
