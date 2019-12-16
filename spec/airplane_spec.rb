require 'airplane'

describe AirPlane do
  it 'defines the class AirPlane' do
    air_plane = AirPlane.new
    expect(air_plane).to be_instance_of AirPlane
  end
end
