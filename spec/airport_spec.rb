require 'airport.rb'
require 'plane.rb'

describe Airport do

  it 'allows planes to land' do
    expect(subject).to respond_to :land_plane
  end

  it 'remembers that a plane has landed' do
    plane = Plane.new
    subject.weather = 1
    subject.land_plane(plane)
    expect(subject.planes[0]).to eq plane
  end

  it 'allows planes to take off' do
    subject.weather = 1
    expect(subject).to respond_to :plane_take_off
  end

  it 'remembers that a plane has taken off' do
    subject.weather = 1
    subject.land_plane
    subject.plane_take_off
    expect(subject.planes[0]).to eq nil
  end

  it 'prevents takeoff if weather is stormy' do
    subject.weather = 1
    subject.land_plane
    subject.weather = 0
    expect { subject.plane_take_off }.to raise_error "Weather Stormy!"
  end

  it 'prevents landing if weather is stormy' do
    subject.weather = 0
    expect { subject.land_plane }.to raise_error "Weather Stormy!"
  end

  it 'prevents landing if airport is full' do
    subject.weather = 1
    10.times { subject.land_plane }
    expect { subject.land_plane }.to raise_error "Airport Full!"
  end

  it 'prevents plane_take_off if there are no planes' do
    subject.weather = 1
    10.times { subject.land_plane }
    expect { 11.times { subject.plane_take_off } }.to raise_error "Airport Empty!"
  end

end
