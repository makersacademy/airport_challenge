require './lib/airport'
require './lib/weather'
describe Airport do


  it 'responds to release_plane' do
    expect(subject).to respond_to :release_plane
  end

  it { is_expected.to respond_to(:land).with(1).argument }

  it { is_expected.to respond_to(:plane) }

  it 'lands a plane' do
    plane = Plane.new
    @weather = double("weather")
    allow(weather).to receive(:stormy?) { false }
    expect(subject.land(plane)).to eq subject.planes
  end

  it 'confirms planes have landed' do
    plane = Plane.new
    weather = double("weather")
    allow(weather).to receive(:stormy?) { false }
    subject.land(plane)
    expect(subject.planes).to eq subject.planes
  end

  it 'ensures planes that have already landed cannot land again' do
    plane = Plane.new
    subject.land(plane)
    expect { subject.land(plane) }.to raise_error 'plane has already landed'
  end

  it { is_expected.to respond_to(:take_off).with(1).argument }

  it 'instructs a plane to take off' do
    plane = Plane.new
    airport = Airport.new
    airport.land(plane)
    expect(airport.take_off(plane)).to eq plane
  end

  it 'ensures planes can only take off from airports they are in' do
    expect { subject.take_off(@plane) }.to raise_error 'no planes to take off'
  end

  it 'ensures planes already flying cannot takeoff' do
    plane = Plane.new
    airport = Airport.new
    airport.land(plane)
    airport.take_off(plane)
    expect { airport.take_off(plane) }.to raise_error 'no planes to take off'
  end

  it 'confirms planes are no longer in the airport after take off' do
    subject.land(@plane)
    subject.take_off(@plane)
    expect(subject.planecount).to eq 0
  end

  it 'prevents planes from landing if weather is stormy' do
    weather2 = instance_double("Weather")
    airport = Airport.new
    allow(weather2).to receive(:stormy?) { true }
    expect { airport.land(@plane) }.to raise_error 'plane cannot land in stormy weather'
    end




end
