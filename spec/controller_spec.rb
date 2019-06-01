require 'controller'

describe Controller do
  it 'can respond to a request to decide to land a plane' do
    expect(subject).to respond_to(:land_plane?)
  end

  it 'decides not to allow plane to land if airport is full' do
    airport = Airport.new
    airport.capacity = 10
    airport.planes = 10
    expect(subject.land_plane?(airport)).to eql(false)
  end

  it 'decides not to allow plane to land if weather is stormy' do
  end
end