require 'plane'
require 'airport'
require 'weather'


describe Plane do

  let(:testweather) { double :Weather}

  it { is_expected.to be_instance_of(Plane) }

  it 'is initialized as landed' do
    expect(subject.in_air).to eq(false)
  end

  it 'in_air is true if plane has taken off' do
    airport = Airport.new
    allow(testweather).to receive(:getweather) { "sunny" }
    airport.take_off_plane(subject, testweather)
    expect(subject.in_air).to eq true
  end

  it 'in_air is false if plane has landed' do
    airport = Airport.new
    subject.in_air = true
    allow(testweather).to receive(:getweather) { "sunny" }
    airport.land_plane(subject, testweather)
    expect(subject.in_air).to eq false
  end
end
