require 'plane'

describe 'Planes can land in the airport', :focus => true do
  #expect airport to accept land plane and return plane/true
  it 'responds to #land_plane' do
    new_plane = Plane.new
    expect(subject.land_plane(new_plane)).to eq true
  end
end
