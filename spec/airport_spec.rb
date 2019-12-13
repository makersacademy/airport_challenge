
require './lib/airport'

describe AirPort do
  it 'defines the class AirPort' do
    air_port = AirPort.new
    expect(air_port).to be_instance_of AirPort
   end
end
