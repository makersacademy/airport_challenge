require 'atc'
require 'sd'
require 'air'
require 'airport'
require 'weather'
require 'plane'
require 'world'

describe Atc do

  it 'responds to where_is(Plane, World)' do
    expect(subject).to respond_to(:where_is).with(2).argument
  end
  
  it 'where_is(Plane) returns Air, Airport or false' do
#    plane = Plane.new
    expect(subject.where_is(Plane.new, World.new)).to be_an_instance_of(Air).or be_an_instance_of(Airport).or eq(false)
  end
end
