require 'airport'

describe Airport do

  it 'can land a flying plane' do
    plane = create_flying_plane

    subject = Airport.new(create_normal_weather)
    subject.land(plane)

    expect(plane).not_to be_flying
  end

  it 'prevents landing a plane which is already landed' do
    plane = create_landed_plane

    subject = Airport.new(create_normal_weather)

    expect { subject.land(plane) }.to raise_error("Unable to land, plane is not flying.")
  end

  it "prevents landing in stormy weather" do
    plane = create_flying_plane
    subject = Airport.new(create_stormy_weather)

    expect { subject.land(plane) }.to raise_error("Unable to land, stormy weather.")
    expect(plane).to be_flying
  end

  it "has default capacity of 20" do
    expect(Airport::DEFAULT_CAPACITY).to eq 20
  end

  it "prevents landing when airport is full with default capacity" do
    subject = Airport.new(create_normal_weather)

    Airport::DEFAULT_CAPACITY.times { subject.land(create_flying_plane) }

    expect { subject.land(create_flying_plane) }.to raise_error("Unable to land, airport full.")
  end

  it "prevents landing when airport is full with given capacity" do
    plane1 = create_flying_plane
    plane2 = create_flying_plane
    plane3 = create_flying_plane
    capacity = 2

    subject = Airport.new(create_normal_weather, capacity)
    subject.land(plane1)
    subject.land(plane2)

    expect { subject.land(plane3) }.to raise_error("Unable to land, airport full.")
    expect(plane1).not_to be_flying
    expect(plane2).not_to be_flying
    expect(plane3).to be_flying
  end

  it "cannot take off an already flying plane" do
    subject = Airport.new(create_normal_weather)

    expect { subject.take_off(create_flying_plane) }.to raise_error("Unable to take off, plane is already flying.")
  end

  it 'can take off a landed plane' do
    plane = create_flying_plane
    subject = Airport.new(create_normal_weather)
    subject.land(plane)

    subject.take_off(plane)

    expect(plane).to be_flying
  end

  it 'cannot take off a plane landed in another airport' do
    subject = Airport.new(create_normal_weather)

    expect { subject.take_off(create_landed_plane) }.to raise_error("Unable to take off, plane not landed in this airport.")
  end

  it 'prevents take off if weather is stormy' do
    plane = create_flying_plane
    weather = create_normal_weather
    subject = Airport.new(weather)
    subject.land(plane)

    allow(weather).to receive(:stormy?).and_return(true)

    expect { subject.take_off(plane) }.to raise_error("Unable to take off, stormy weather.")
    expect(plane).not_to be_flying
  end

  def create_fake_weather(stormy)
    weather = double("FakeWeather")
    allow(weather).to receive(:stormy?).and_return(stormy)
    weather
  end

  def create_stormy_weather
    create_fake_weather(true)
  end

  def create_normal_weather
    create_fake_weather(false)
  end

  def create_flying_plane
    plane = Plane.new
    plane.fly
    plane
  end

  def create_landed_plane
    plane = Plane.new
    plane.land
    plane
  end

end
