require 'airport'
require 'plane'
require 'weather'

describe Airport do
  
  let(:plane) { Plane.new }
  let(:weather) { Weather.new }

  it "instructs a plane to land at an airport" do
    allow(subject.weather).to receive(:forecast) { "sunny" }
    expect(subject).to respond_to(:land)
  end

  it "instructs plane to take off from an airport" do
    allow(subject.weather).to receive(:forecast) { "sunny" }
    expect(subject).to respond_to(:takeoff).with(1).argument
  end

  it "confirm a plane is no longer in the airport" do
    allow(subject.weather).to receive(:forecast) { "sunny" }
    subject.land(plane)
    expect(subject.takeoff(plane)).to eq "#{plane} is in the clouds"
  end

  it "prevents landing when airport is full" do
    Airport::DEFAULT_CAPACITY.times { subject.land(plane) }
    expect { subject.land(plane) }.to raise_error "Sorry, Airport packed over capacity"
  end

  it "prevents take off when weather is stormy" do
    allow(subject.weather).to receive(:forecast) { "stormy" }
    expect { subject.takeoff(plane) }.to raise_error "Stormy weather, take off not happening"
  end

  it "prevents landing when weather is stormy" do
    allow(subject.weather).to receive(:forecast) { "stormy" }
    expect { subject.land(plane) }.to raise_error "Stormy weather, land somewhere else"
  end

  describe ' #edge cases' do

    it "ensures that planes can only take off from airports they are in" do
      allow(subject.weather).to receive(:forecast) { "sunny" }
      airport_2 = Airport.new
      allow(airport_2.weather).to receive(:forecast) { "sunny" }
      subject.land(plane)
      expect { airport_2.takeoff(plane) }.to raise_error "Plane is in a different airport"
    end

  end

end
