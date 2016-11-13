require 'airport.rb'
require 'weather.rb'

describe Airport do

  let(:weather) { double("weather", :check => "Sunny") }
  let(:plane) { double("plane", :landed= => nil, :landed => false) }

  it 'Checks an airport exists' do
    expect(subject).to equal subject
  end

  it 'Checks that a plane can land' do
    expect(subject.land(plane,weather)).to eq subject.planes
  end

  it 'Checks that an airport is able to list its current planes' do
    plane_1 = double(:plane, :landed= => nil, :landed => false)
    plane_2 = double(:plane, :landed= => nil, :landed => false)
    subject.land(plane_1,weather)
    subject.land(plane_2,weather)
    expect(subject.planes).to eq [plane_1 , plane_2]
  end

  it 'Checks that a plane can take off from an airport if the weather is Sunny' do
    subject.land(plane,weather)
    expect(subject.take_off(plane,weather)).to eq plane
  end

  it 'Checks that a plane is not in airport once taken off' do
    subject.land(plane,weather)
    subject.take_off(plane,weather.check)
    expect(subject.planes).to be_empty
  end

  it 'Checks that a plane can take off from an airport if the weather is bad' do
    weather = double("weather", :check => "Stormy")
    subject.land(plane,weather)
    weather = weather.check
    message = "Cannot take off in stormy weather"
    expect{subject.take_off(plane, weather)}.to raise_error message
  end

  it 'Checks that a plane cannot land at an airport if the weather is bad' do
    weather = double("weather", :check => "Stormy")
    weather = weather.check
    message = "Cannot land planes if the weather if stormy"
    expect{subject.land(plane,weather)}.to raise_error message
  end

  it 'Checks for the capacity of the airport to equal 12' do
    expect(subject.capacity).to eq 12
  end

  it 'Checks that 12 planes can land at an airport' do
    12.times{subject.land(double(:plane, :landed= => nil, :landed => false),weather)}
    expect(subject.planes.count).to eq 12
  end

  it 'Checks that planes cannot land at an airport when full' do
    12.times{subject.land(double(:plane, :landed= => nil, :landed => false),weather)}
    message =  "Sorry, Airport is full, please fly to another"
    expect{subject.land(plane,weather)}.to raise_error message
  end

  it 'Checks for the capacity of the airport to equal 12' do
    airport2 = Airport.new(24)
    expect(airport2.capacity).to eq 24
  end

end

describe 'Edgecase Tests' do
  let(:weather) { double("weather", :check => "Sunny") }
  let(:plane) { double("plane", :landed= => nil, :landed => true) }

  it 'Checks that the same plane cannot land twice' do
    subject = Airport.new
    message =  "This plane has already landed"
    expect{subject.land(plane, weather)}.to raise_error message
  end

  it 'Checks that the same plane cannot take off twice' do
    subject = Airport.new
    message = "That plane is not in this airport"
    expect{subject.take_off(plane, weather)}.to raise_error message
  end

end
