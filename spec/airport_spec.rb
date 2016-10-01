require 'airport'
require 'plane'

describe Airport do
  it 'sets up instance variables correctly' do
    expect(subject.capacity).to eq 20
    expect(subject.weather).to eq "nice"
    expect(subject.planes).to eq []
  end

  it {should respond_to :accept_plane}

  it 'can accept a plane to land' do
    heathrow = Airport.new
    plane = Plane.new
    heathrow.accept_plane(plane)
    expect(heathrow.planes[0]).to eq plane
  end

  it {should respond_to :plane_departs}

  it 'can recognise that a plane has left' do
    heathrow = Airport.new
    plane = Plane.new
    heathrow.accept_plane(plane)
    heathrow.plane_departs(plane)
    expect(heathrow.planes).to eq []
  end

end
