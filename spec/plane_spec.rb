require 'plane'
require 'airport'
require 'weather'


describe Plane do
  subject { Plane.new("1") }

  let(:testweather) { double :Weather}

  it "can create a new plane" do
    expect(subject).to be_instance_of(Plane)
  end

  it 'is initialized as landed' do
    expect(subject.in_air?).to eq(false)
  end

  it 'in_air is true if plane has taken off' do
    airport = Airport.new
    allow(testweather).to receive(:getweather) { "sunny" }
    airport.take_off_plane(subject, testweather)
    expect(subject.in_air?).to eq true
  end

  it 'in_air is false if plane has landed' do
    airport = Airport.new
    subject.takeoff
    allow(testweather).to receive(:getweather) { "sunny" }
    airport.land_plane(subject, testweather)
    expect(subject.in_air?).to eq false
  end

  it 'can respond to takeoff command' do
    subject.takeoff
    expect(subject.in_air?).to eq(true)
  end

  it 'can respond to land command' do
    subject.takeoff
    subject.land
    expect(subject.in_air?).to eq(false)
  end

  it 'returns error if landed and commanded to land' do
    plane = Plane.new("1")
    expect { plane.land }.to raise_error("Plane 1 already landed")
  end

  it 'returns error if in air and commanded to takeoff' do
    plane = Plane.new("1")
    plane.takeoff
    expect { plane.takeoff }.to raise_error("Plane 1 already in air")
  end

end
