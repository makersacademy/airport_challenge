require 'world'
require 'air'
require 'airport'
require 'plane'

describe World do

  it 'responds to add' do
    expect(subject).to respond_to(:add).with(1).arguments
  end
  
  it 'returns true or false' do
    air = Air.new
    expect(subject.add(air)).to eq(true).or eq(false)
  end
  
  it 'returns false if object is not Air, Airport or Planes' do
    expect(subject.add(1)).to eq(false)
    
    air = Air.new
    expect(subject.add(air)).to eq(true)
    
    airport = Airport.new
    expect(subject.add(airport)).to eq(true)
    
    plane = Plane.new
    expect(subject.add(plane)).to eq(true)
  end
  
end
