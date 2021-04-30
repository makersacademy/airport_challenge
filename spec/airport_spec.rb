require 'airport'
require 'plane'

# As an air traffic controller
# So I can get passengers to a destination
# I want to instruct a plane to land at an airport *
# I want to instruct a plane to take off from an airport and confirm that it is no longer in the airport *
# I want to prevent landing when the airport is full *

# As the system designer
# So that the software can be used for many different airports
# I would like a default airport capacity that can be overridden as appropriate *

# As an air traffic controller
# To ensure safety
# I want to prevent takeoff when weather is stormy *
# I want to prevent landing when weather is stormy *

describe Airport do

  it "allows a plane to land" do
    expect(subject).to respond_to(:land_plane).with(1).argument
  end

  it "planes that have already landed can not land again" do
    plane = double("plane", :landed? => true)
    allow(subject).to receive(:stormy?) { false }
    expect { subject.land_plane(plane) }.to raise_error "Plane already grounded"
  end

  it "allows a plane to take off" do
    expect(subject).to respond_to(:take_off).with(1).argument
  end

  it "planes that are already flying can not take off" do
    plane = double("plane", :landed? => false)
    allow(subject).to receive(:stormy?) { false }
    expect { subject.take_off(plane) }.to raise_error "Plane currently flying"
  end

  it "confirms planes that have been instructed to take off are no longer in the airport" do
    plane = double("plane", :landed? => true)
    allow(subject).to receive(:stormy?) { false }
    subject.take_off(plane)
    expect(subject.planes).not_to include(plane)
  end

  it 'raises error when airport is full' do
    plane = double("plane", :landed? => false)
    allow(subject).to receive(:stormy?) { false }
    subject.capacity.times { subject.land_plane(plane) }
    expect { subject.land_plane(plane) }.to raise_error 'Airport full'
  end

  it 'has a default capacity' do
    plane = double("plane", :landed? => false)
    allow(subject).to receive(:stormy?) { false }
    Airport::DEFAULT_CAPACITY.times { subject.land_plane(plane) }
    expect { subject.land_plane(plane) }.to raise_error 'Airport full'
  end

  it "stops take off when weather is stormy" do
    plane = double(:plane)
    allow(subject).to receive(:stormy?) { true }
    expect { subject.take_off(plane) }.to raise_error "Stormy weather - take off not permitted"
  end

  it "stops landing when weather is stormy" do
    plane = double(:plane)
    allow(subject).to receive(:stormy?) { true }
    expect { subject.land_plane(plane) }.to raise_error "Stormy weather - landing not permitted"
  end

end
