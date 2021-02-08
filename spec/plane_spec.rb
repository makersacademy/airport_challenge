require "plane.rb"

describe Plane do
  subject(:plane) { Plane.new }
  let(:airport) { double :airport }

  before(:each) do
    allow(airport).to receive(:land).and_return(true)
    allow(airport).to receive(:takeoff).and_return(true)
    allow(airport).to receive(:safe?).and_return(true)
    allow(airport).to receive(:space?).and_return(true)
    allow(airport).to receive(:takeoff).and_return(true)
  end

  it "lands at an airport" do
    plane.land(airport)
    expect(plane.location).to eq airport
  end

  it "create a plane inside an airport" do
    test_plane = Plane.new(airport)
    expect(test_plane.location).to eq airport
  end

  it "takes off" do
    plane.instance_variable_set(:@location, airport)
    plane.takeoff()
    expect(plane.location).to eq :in_flight
  end

  it "can't take off when not at airport" do
    plane.instance_variable_set(:@location, :in_flight)
    expect { plane.takeoff }.to raise_error
  end

  it "can't land when not in the air" do
    plane.instance_variable_set(:@location, airport)
    expect { plane.land(airport) }.to raise_error("Already in an airport")
  end

  it "doesn't land when airport is full" do
    allow(airport).to receive(:space?).and_return(false)
    expect { plane.land(airport) }.to raise_error("Airport is full")
  end

  context "when weather is bad:" do
    before do
      allow(airport).to receive(:safe?).and_return(false)
    end

    it "doesn't land when the weather is unsafe" do
      expect { plane.land(airport) }.to raise_error("Not safe to land")
    end

    it "doesn't takeoff when the weather is unsafe" do
      plane.instance_variable_set(:@location, airport)
      expect { plane.takeoff }.to raise_error("Not safe to takeoff")
      expect(plane.location).to eq airport
    end
  end
end
