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
    @airport.takeoff
    expect(@airport.hangar.empty?).to eq true
  end
end
