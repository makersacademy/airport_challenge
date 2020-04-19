require 'plane'
require 'airport'
require 'weather'

describe Airport do
  it 'Airport responds to land method with one argument' do
    expect(subject).to respond_to(:land).with(1).argument
  end

  it 'Airport responds to take off method with one argument' do
    expect(subject).to respond_to(:take_off).with(1).argument
  end

  it 'Land method returns message' do
    plane = Plane.new
    expect(subject.land(plane)).to eq "#{plane} has landed"
  end

  it 'Take off method returns message with airport information' do
    plane = Plane.new
    subject.land(plane)
    expect(subject.take_off(plane)).to eq "#{plane} has taken off and is no longer at #{subject}"
  end

  it 'Plane added to plane array when landed' do
    plane = Plane.new
    subject.land(plane)
    expect(subject.plane[-1]).to eq plane
  end

  it 'Plane removed from airport class - plane array when it has taken off' do
    plane = Plane.new
    subject.land(plane)
    subject.take_off(plane)
    expect(subject.plane).not_to include(plane)
  end

  it 'Raise error to take off plane if it has already taken off' do
    plane = Plane.new
    subject.land(plane)
    subject.take_off(plane)
    expect { subject.take_off(plane) }.to raise_error("This plane (#{plane}) has already taken off")
  end

  it 'Raise error to land plane if plane has already landed' do
    plane = Plane.new
    subject.land(plane)
    expect { subject.land(plane) }.to raise_error("This plane (#{plane}) has already landed")
  end

  it 'Airport plane array has number of planes that capacity is set at' do
    airport = Airport.new(20)
    expect(airport.plane.length).to eq 20
  end

  it 'Raise error if landing plane when maximum capacity reached (max capacity = 50)' do
    airport = Airport.new(50)
    plane = Plane.new
    expect { airport.land(plane) }.to raise_error "This airport (#{airport}) has reached maximum capacity."
  end
end

describe WeatherGenerator do
  it 'Weather Generator responds to random method' do
    expect(subject).to respond_to(:random)
  end

  it 'Random generates random number between 0 and 3' do
    generator = WeatherGenerator.new
    allow(generator).to receive(:rand).and_return(3)
    expect(generator.random).to eq(3)
  end

  it 'Weather returns string "stormy"' do
    generator = WeatherGenerator.new
    allow(generator).to receive(:rand).and_return(3)
    expect(generator.weather).to eq "stormy"
  end
end
