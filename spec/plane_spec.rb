require 'plane'

describe Plane do

  it 'is flying after take off' do
    expect(subject.status).to eq :flying
  end

  it 'is landed after landing' do
    plane = Plane.new
    plane.land
    expect(plane.status).to eq :landed
  end
end
