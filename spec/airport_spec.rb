require 'airport'

describe Airport do

  it 'can land a plane' do
    plane = Plane.new

    subject = Airport.new(create_normal_weather)
    subject.land(plane)

    expect(subject.planes).to eq [plane]
  end

  it 'can land multiple planes' do
    plane1 = Plane.new
    plane2 = Plane.new

    subject = Airport.new(create_normal_weather)
    subject.land(plane1)
    subject.land(plane2)

    expect(subject.planes).to eq [plane1, plane2]
  end

  it 'prevents landing a plane which is already landed' do
    plane = Plane.new

    subject = Airport.new(create_normal_weather)
    subject.land(plane)

    expect { subject.land(plane) }.to raise_error("Unable to land, plane already landed.")
    expect(subject.planes).to eq [plane]
  end

  it "prevents landing in stormy weather" do
    plane = Plane.new
    subject = Airport.new(create_stormy_weather)

    expect { subject.land(plane) }.to raise_error("Unable to land, stormy weather.")
    expect(subject.planes).to be_empty
  end

  it "has default capacity of 20" do
    expect(Airport::DEFAULT_CAPACITY).to eq 20
  end

  it "prevents landing when airport is full with default capacity" do
    subject = Airport.new(create_normal_weather)

    Airport::DEFAULT_CAPACITY.times { subject.land(Plane.new) }

    expect { subject.land(Plane.new) }.to raise_error("Unable to land, airport full.")
    expect(subject.planes.count).to eq Airport::DEFAULT_CAPACITY
  end

  it "prevents landing when airport is full with given capacity" do
    plane1 = Plane.new
    plane2 = Plane.new
    capacity = 2

    subject = Airport.new(create_normal_weather, capacity)
    subject.land(plane1)
    subject.land(plane2)

    expect { subject.land(Plane.new) }.to raise_error("Unable to land, airport full.")
    expect(subject.planes).to eq [plane1, plane2]
  end

  it "cannot take off a non landed plane" do
    subject = Airport.new(create_normal_weather)

    expect { subject.take_off(Plane.new) }.to raise_error("Unable to take off, plane not landed.")
  end

  it 'can take off a landed plane' do
    plane = Plane.new
    subject = Airport.new(create_normal_weather)
    subject.land(plane)

    subject.take_off(plane)

    expect(subject.planes).to be_empty
  end

  it 'can take off a landed plane without affecting other landed planes in normal weather' do
    plane1 = Plane.new
    plane2 = Plane.new
    plane3 = Plane.new

    subject = Airport.new(create_normal_weather)
    subject.land(plane1)
    subject.land(plane2)
    subject.land(plane3)

    subject.take_off(plane2)

    expect(subject.planes).to eq [plane1, plane3]
  end

  it 'prevents take off if weather is stormy' do
    plane = Plane.new
    weather = create_normal_weather
    subject = Airport.new(weather)
    subject.land(plane)

    allow(weather).to receive(:stormy?).and_return(true)

    expect { subject.take_off(plane) }.to raise_error("Unable to take off, stormy weather.")
    expect(subject.planes).to eq [plane]
  end

  def create_stormy_weather
    weather = double("Weather")
    allow(weather).to receive(:stormy?).and_return(true)
    weather
  end

  def create_normal_weather
    weather = double("Weather")
    allow(weather).to receive(:stormy?).and_return(false)
    weather
  end
end
