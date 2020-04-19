require 'world'
require 'air'
require 'airport'
require 'plane'

describe World do

  it 'check for @air instance variable on creation' do
    # TODO: This doesn't seem to actually check for the instance variable
    expect(subject.instance_variable_get(:@air))
  end
  
  it 'responds to show' do
    expect(subject).to respond_to(:show)
  end

  it 'responds to air' do
    expect(subject).to respond_to(:air)
  end

  it 'responds to add' do
    expect(subject).to respond_to(:add).with(1).arguments
  end
  
  it ',show returns Array' do
    expect(subject.show).to be_an_instance_of(Array)
  end
  
  it '.air returns Air' do
    expect(subject.air).to be_an_instance_of(Air)
  end

  it '.add returns true or false' do
    air = Air.new
    expect(subject.add(air)).to eq(true).or eq(false)
  end
  
  it '.add returns false if object is not Airport or Planes' do
    air = Air.new
    expect(subject.add(air)).to eq(false)
    
    airport = Airport.new
    expect(subject.add(airport)).to eq(true)
    
    plane = Plane.new
    expect(subject.add(plane)).to eq(true)
  end
  
end
