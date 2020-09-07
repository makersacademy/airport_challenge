require 'airport_station.rb'
require 'plane.rb'

describe AirportStation do
  it 'responds to let Plane land' do
    plane = Plane.new
    expect(plane).to respond_to(:land?)
  end
  
  it 'responds to let plane take off' do
    plane = Plane.new
    expect(plane).to respond_to(:take_off?)
  end  

  it 'raises an error when there are no planes at airport' do
    subject.take_off
    expect { subject.take_off? }.to raise_error(RuntimeError, 'Airport empty')
  end  
end
