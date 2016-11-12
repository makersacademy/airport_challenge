require 'airport.rb'
require 'weather.rb'

describe Airport do

  let(:weather) { double("weather", :check => "Sunny") }
  let(:plane) {double("plane")}

  it 'expects an airport to exist' do
    expect(subject).to equal subject
  end

  it 'expects an airport to accept a plane to land' do
    expect(subject.land(plane)).to eq subject.planes
  end

  it 'expects an airport to be able to list its current planes' do
    subject.land(plane)
    subject.land(plane)
    subject.planes.inspect
    expect(subject.planes).to eq subject.planes
  end

  it 'expects a plane to take off from an airport if the weather is Sunny' do
    plane = plane
    subject.land(plane)
    expect(subject.take_off(plane,weather)).to eq plane
  end

  it 'expects an airport not to contain a plane in it once taken off' do
    subject.land(plane)
    subject.take_off(plane,weather.check)
    expect(subject.planes).to be_empty
  end

  it 'expects the plane not to be allowed to take off if the weather is bad' do
    weather = double("weather", :check => "Stormy")
    subject.land(plane)
    weather = weather.check
    expect{subject.take_off(plane, weather)}.to raise_error("Cannot take off in stormy weather")
  end



end
