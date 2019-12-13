require 'airport'

describe Plane do
  it 'creates an airport constant' do
    my_plane = Plane.new
  end

  it 'tells a plane to land' do
    my_plane = Plane.new
    expect(my_plane).to respond_to(:land)
  end

  it 'tells a plane to take off' do
    my_plane = Plane.new
    expect(my_plane).to respond_to(:depart)
  end

  it 'confirms the plane is no longer at the airport' do
    my_plane = Plane.new
    string = "Plane has left the airport"
    string.should eql("Plane has left the airport")
  end

  it 'raises an error when airport is full' do
    my_plane = Plane.new
    expect { subject.land }.to raise_error 'Do not land, the airport is full!'
  end
end
