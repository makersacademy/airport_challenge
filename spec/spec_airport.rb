require 'airport.rb'
require 'plane.rb'

describe Airport do
  before(:each) do
    @airport = Airport.new
    @plane = Plane.new
  end

  it 'creates new Airport object' do
    expect(subject).to be_instance_of Airport
  end

  it 'responds to landing' do
    expect(subject).to respond_to(:land)
  end

  it 'stores landed plane' do
    @airport.land(@plane)
    expect(@airport.hangar.empty?).to eq false
  end

  it 'responds to takeoff' do
    expect(subject).to respond_to(:takeoff)
  end

  it 'removes plane taking off' do
    @airport.land(@plane)
    expect(@airport.hangar.empty?).to eq false
    # allow(weather).to receive(:stormy?).and_return(true)
    @airport.takeoff
    expect(@airport.hangar.empty?).to eq true
  end

  it 'responds to hangar_full?' do
    expect(subject).to respond_to(:hangar_full?)
  end

  it 'raises error when landing plane in full hangar' do
    12.times { subject.land Plane.new }
    expect { subject.land(@plane)}.to raise_error 'Hangar is full!'
  end

  it 'allows change to default capacity' do
    expect(subject.capacity).to eq 12
    zurich = Airport.new(25)
    expect(zurich.capacity).to eq 25
  end
end
