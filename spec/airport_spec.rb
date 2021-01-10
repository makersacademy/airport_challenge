require 'airport'

describe Airport do
  it 'has a default capacity of 20' do
    expect(subject.capacity).to eq 20
  end

  it 'can change the capacity for new airports' do
    airport = Airport.new(100)
    expect(airport.capacity).to eq 100
  end

  it 'responds to .generate_weather' do
    expect(subject).to respond_to(:generate_weather)
  end

  it 'sets the weather to sunny' do
    expect(subject.generate_weather("sunny")).to eq "sunny"
  end

  it 'also can set the weather to stormy' do
    expect(subject.generate_weather("stormy")).to eq "stormy"
  end

  it 'responds to land' do
    expect(subject).to respond_to(:land).with(1).argument
  end

  it 'responds to land' do
    expect(subject).to respond_to(:takeoff).with(1).argument
  end

  it 'lets planes can land' do
    airport = Airport.new
    plane = Plane.new
    airport.generate_weather("sunny")
    expect(airport.land(plane)).to eq [plane]
  end

  it 'stores the planes at the airport' do
    airport = Airport.new
    plane = Plane.new
    airport.generate_weather("sunny")
    airport.land(plane)
    expect(airport.planes_in_airport).to eq [plane]
  end

  it "doesn't let planes land in storms" do
    airport = Airport.new
    plane = Plane.new
    airport.generate_weather("stormy")
    expect { airport.land(plane) }.to raise_error "Weather is too bad for landing"
  end

  it "doesn't let planes land if at full capacity" do
    airport = Airport.new(5)
    airport.generate_weather("sunny")
    5.times { airport.land(Plane.new) }
    expect { airport.land(Plane.new) }.to raise_error "Airport at full capacity"
  end

  it 'lets planes takeoff' do
    airport = Airport.new
    plane = Plane.new
    airport.generate_weather("sunny")
    airport.land(plane)
    expect(airport.takeoff(plane)).to eq plane
  end

  it 'confirms planes have taken off after takeoff' do
    airport = Airport.new
    plane = Plane.new
    airport.generate_weather("sunny")
    airport.land(plane)
    airport.takeoff(plane)
    expect(airport.planes_in_airport).to eq []
  end

  it "doesn't let planes takeoff if there are none in airport" do
    airport = Airport.new
    plane = Plane.new
    airport.generate_weather("sunny")
    expect { airport.takeoff(plane) }.to raise_error "No planes available for takeoff"
  end

  it "doesn't let planes take off in storms" do
    airport = Airport.new
    plane = Plane.new
    airport.generate_weather("stormy")
    expect { airport.takeoff(plane) }.to raise_error "Weather is too bad for takeoff"
  end

  it "planes can only take off from airports they are in" do
    airport = Airport.new
    airport2 = Airport.new
    plane = Plane.new
    airport.generate_weather("sunny")
    airport2.generate_weather("sunny")
    airport.land(plane)
    airport2.land(Plane.new)
    expect { airport2.takeoff(plane) }.to raise_error "Plane not at this airport"
  end

  it 'planes that are already flying cannot take off/be in an airport' do
    airport = Airport.new
    plane = Plane.new
    plane2 = Plane.new
    airport.generate_weather("sunny")
    airport.land(plane)
    airport.land(plane2)
    airport.takeoff(plane)
    expect { airport.takeoff(plane) }.to raise_error "Plane not at this airport"
    expect(airport.planes_in_airport).to eq [plane2]
  end

  it 'planes that have landed cannot land again' do
    airport = Airport.new
    plane = Plane.new
    airport.generate_weather("sunny")
    airport.land(plane)
    expect { airport.land(plane) }.to raise_error "Plane is not flying"
  end

  it 'planes that have landed in one airport cannot land in another' do
    airport = Airport.new
    airport2 = Airport.new
    plane = Plane.new
    airport.generate_weather("sunny")
    airport2.generate_weather("sunny")
    airport.land(plane)
    expect { airport2.land(plane) }.to raise_error "Plane is not flying"
  end
end

describe Plane do
end
