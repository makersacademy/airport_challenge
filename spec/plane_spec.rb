require 'plane'

describe 'plane' do
  it 'tests whether an instance of plane responds to land method' do
    expect(Plane.new).to respond_to :land
  end

  it 'tests whether a plane has truly landed' do
    expect(Plane.new.land). to be_truthy
  end
end
