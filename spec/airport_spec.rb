require "airport"
require "plane"

describe Airport do
  let(:plane) { Plane.new }

  it "can instruct plane to land" do
    expect(subject).to respond_to(:land).with(1).argument
    # expect(subject.land(plane)).to eq([plane])
  end

  it "can instruct a plane to take off from airport" do
    subject.land(plane)
    expect(subject).to respond_to(:take_off).with(1).argument
  end

  it "can confirm that a plane has taken off and is not at airport" do
    subject.take_off(plane)
    expect(subject.planes).not_to include(plane) # need to use attr_accessor for planes
    expect(subject.confirm_takeoff(plane)).to eq(true)
  end

  it "can prevent landing when airport is full" do
    50.times { subject.land(plane) }
    expect { subject.land(plane) }.to raise_error("Airport is full, cannot land!") if subject.planes.size >= subject.capacity
  end

  it "can override default airport capacity" do
    random_capacity = Random.rand(500)
    subject = Airport.new(random_capacity)
    expect(subject.capacity).to eq(random_capacity)
  end

  it "can prevent takeoff when weather is stormy" do
    expect { subject.take_off(plane) }.to raise_error("Weather is stormy, cannot take off!") if subject.weather == "stormy"
  end

  it "can prevent landind when weather is stormy" do
    expect { subject.land(plane) }.to raise_error("Weather is stormy, cannot land!") if subject.weather == "stormy"
  end
end
