require 'airport.rb'
require 'plane.rb'

describe Airport do


  it 'allows planes to land' do
    expect(subject).to respond_to :land_plane
  end

  it 'remembers that a plane has landed' do
    plane = Plane.new
    subject.land_plane(plane)
    expect(subject.planes[0]).to eq plane
  end

  it 'allows planes to take off' do
    expect(subject).to respond_to :plane_take_off
  end

  it 'remembers that a plane has taken off' do
  subject.land_plane("test")
  subject.plane_take_off
  expect(subject.planes[0]).to eq nil
  end

  it 'prevents takeoff if weather is stormy' do
    subject.land_plane("test")
    subject.weather = 0
    expect { subject.plane_take_off }.to raise_error "Weather Stormy!"
  end

  it 'prevents landing if weather is stormy' do
    subject.weather = 0
    expect { subject.land_plane("test") }.to raise_error "Weather Stormy!"
  end

  it 'prevents landing if airport is full' do
    10.times { |plane| subject.land_plane(plane) }
    expect { subject.land_plane("test") }.to raise_error "Airport Full!"
  end

end
