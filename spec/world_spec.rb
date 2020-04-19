require 'world'
require 'air'
require 'airport'
require 'plane'

describe World do

  it 'check for @air instance variable on creation' do
    # TODO: This doesn't seem to actually check for the instance variable
    # TODO: Need to check instance is Air
    expect(subject.instance_variable_get(:@air))
  end
  
  it 'check for @planes instance variable on creation' do
    # TODO: This doesn't seem to actually check for the instance variable
    # TODO: Need to check instance is Array of Plane
    expect(subject.instance_variable_get(:@planes))
  end

  it 'check for @airports instance variable on creation' do
    # TODO: This doesn't seem to actually check for the instance variable
    # TODO: Need to check instance is Array of Airport
    expect(subject.instance_variable_get(:@airports))
  end

  it 'responds to view' do
    expect(subject).to respond_to(:view)
  end

  it 'responds to air' do
    expect(subject).to respond_to(:air)
  end

  it 'responds to add' do
    expect(subject).to respond_to(:add).with(1).arguments
  end
  
  it 'responds to where_is(object)' do
    expect(subject).to respond_to(:where_is).with(1).arguments
  end
  
  it 'responds to land(plane, airport)' do
    expect(subject).to respond_to(:land).with(2).arguments
  end
  
  it '.view returns Array' do
    # TODO: Check it returns Array of [Air, [Airport], [Plane] ]
    expect(subject.view).to be_an_instance_of(Array)
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
  
  it '.add(Plane) puts the Plane in the Air' do
    # TODO: finish
    plane = Plane.new
    subject.add(plane)
  end
  
  it '.where_is returns Air, Airport or false' do
    plane = Plane.new
    expect(subject.where_is(plane)).to be_an_instance_of(Air).or be_an_instance_of(Airport).or eq(false)
  end
  
  it '.where_is(plane) returns false if object is not Air or Aiport' do
    expect(subject.where_is(1)).to eq(false)
    
    plane = Plane.new
    expect(subject.where_is(plane)).to be_an_instance_of(Air).or be_an_instance_of(Airport).or eq(false)
  end
  
  it '.land(plane, airport) returns false if not passed correct types' do
    expect(subject.land(1, 1)).to eq(false)
    expect(subject.land(Plane.new, 1)).to eq(false)
    expect(subject.land(1, Airport.new)).to eq(false)
  end
  
  it '.land(plane, airport) returns true if passed correct types' do
    expect(subject.land(Plane.new, Airport.new)).to eq(true)
  end
  
end
