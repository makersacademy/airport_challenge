require 'airport'
require './lib/plane.rb'

describe Airport do

  let(:testplane) { double :Plane }
  let(:testweather) { double :Weather}

  it { is_expected.to be_instance_of(Airport) }

  it 'can instruct a plane to land' do
    subject.land_plane(testplane)
    expect(subject.planes).to include(testplane)
  end

  it 'can instruct a plane to take off if weather is sunny' do
    allow(testweather).to receive(:getweather) { "sunny" }
    subject.planes << testplane
    subject.take_off_plane(testplane, testweather)
    expect(subject.planes).not_to include(testplane)
  end

  it 'will not land a plane if the airport is full' do
    for i in 1..subject.capacity do
      subject.planes << testplane
    end
    errortext = "Cannot land plane: Airport full"
    expect { subject.land_plane(testplane) }.to raise_error(errortext)
  end

  it 'has a default capacity which can be overridden by passing an integer' do
    airport = Airport.new()
    airport2 = Airport.new(5)
    expect(airport.capacity).to eq Airport::DEFAULT_CAPACITY
    expect(airport2.capacity).to eq 5
  end

  it 'prevents takeoff when weather is stormy' do
    allow(testweather).to receive(:getweather) { "stormy" }
    errortext = "Cannot take off: Weather is stormy"
    expect { subject.take_off_plane(testplane, testweather) } .to raise_error(errortext)
  end

  it 'prevents landing when weather is stormy' do
    allow(testweather).to receive(:getweather) { "stormy" }
    errortext = "Cannot land: Weather is stormy"
    expect { subject.land_plane(testplane, testweather) } .to raise_error(errortext)
  end

end
