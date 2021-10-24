# require_relative '../lib/airport.rb'
require 'airport'

describe Airport do
  subject(:airport) { described_class.new(20) }
  
  it 'lands a plane' do
    expect(airport).to respond_to(:land).with(1).argument
  end
   
  it 'allows plane to take off' do
    expect(airport).to respond_to(:take_off).with(1).argument
  end

  it 'does not allow a plane to land if airport is at full capacity' do
    plane = double :plane
    20.times { airport.land(plane) }
    expect { airport.land(plane) }.to raise_error 'Can not land - full capacity!'
  end


  

end
