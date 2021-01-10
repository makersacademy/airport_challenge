require 'airport'

describe Airport do
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

  it "doesn't let planes land in storms" do
    airport = Airport.new
    plane = Plane.new
    airport.generate_weather("stormy")
    expect { airport.land(plane) }.to raise_error "Weather is too bad for landing"
  end

  it 'lets planes takeoff' do
    airport = Airport.new
    plane = Plane.new
    airport.land(plane)
    expect(airport.takeoff(plane)).to eq plane
  end

  it 'confirms planes have taken off after takeoff' do
    airport = Airport.new
    plane = Plane.new
    airport.land(plane)
    airport.takeoff(plane)
    expect(airport.planes_in_airport).to eq []
  end

  it "doesn't let planes takeoff if there are none in airport" do
    airport = Airport.new
    plane = Plane.new
    expect { airport.takeoff(plane) }.to raise_error "No planes available for takeoff"
  end

  it "doesn't let planes take off in storms" do
    airport = Airport.new
    plane = Plane.new
    airport.generate_weather("stormy")
    expect { airport.takeoff(plane) }.to raise_error "Weather is too bad for takeoff"
  end
end

describe Plane do
  it 'planes can land' do
    airport = Airport.new
    plane = Plane.new
    expect(airport.land(plane)).to eq [plane]
  end

  it 'stores the planes at the airport' do
    airport = Airport.new
    plane = Plane.new
    airport.land(plane)
    expect(airport.planes_in_airport).to eq [plane]
  end
end
