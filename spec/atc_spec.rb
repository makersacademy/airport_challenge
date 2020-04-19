require 'atc'
require 'sd'
require 'air'
require 'airport'
require 'weather'
require 'plane'

describe Atc do

  it 'responds to where_is(Plane)' do
    expect(subject).to respond_to(:where_is).with(1).argument
  end
  
  it 'where_is(Plane) returns Air, Airport or false' do
    plane = Plane.new
    expect(subject.where_is(plane)).to be_an_instance_of(Air).or be_an_instance_of(Airport).or eq(false)
  end
end
