# For Eddie: to resolve the last two stormy user stories, I learned from: https://www.youtube.com/watch?v=Vg0cFVLH_EM

require 'airport'
# As an air traffic controller
# So I can get passengers to a destination
# I want to instruct a plane to land at an airport

describe Airport do
  let(:plane) { double :plane }
  let(:weather) { double :weather }

  it "instruct a plane to land at an airport" do
    subject { Airport.new }
    expect(subject).to respond_to(:land)
  end
  # As an air traffic controller
  # So I can get passengers on the way to their destination
  # I want to instruct a plane to take off from an airport and confirm that it is no longer in the airport

  it "instruct a plane to take off and confirm it left" do
    airport = Airport.new
    expect(subject.take_off(plane)).to eq "plane no longer in the airport"
    # expect(subject).to respond_to(:take_off).with(1)argument
  end
  # As the system designer
  # So that the software can be used for many different airports
  # I would like a default airport capacity that can be overridden as appropriate
  it "has a default capacity" do
    airport = Airport.new
    expect(subject.capacity).to eq Airport::DEFAULT_CAPACITY
  end
  # As an air traffic controller
  # To ensure safety
  # I want to prevent landing when the airport is full

  it "prevents landing when airport is full" do
    subject { Airport.new }
    allow(subject).to receive(:stormy?).and_return false
    10.times do
      subject.land(plane)
    end
    expect{ subject.land(plane) }.to raise_error ('Airport is full')
  end

  # As an air traffic controller
  # To ensure safety
  # I want to prevent takeoff when weather is stormy

  it "prevents takeoff when stormy" do
    subject { Airport.new }
    allow(subject).to receive(:stormy?).and_return true
    expect{subject.take_off(plane)}.to raise_error ('Not safe, it is stormy')
  end

  # As an air traffic controller
  # To ensure safety
  # I want to prevent landing when weather is stormy
  it "prevents landing when stormy" do
    subject { Airport.new }
    allow(subject).to receive(:stormy?).and_return true
    expect{subject.land(plane)}.to raise_error ('Not safe, it is stormy')
  end
end
