require 'plane'
require 'airport'

describe Plane do
  let(:plane) { Plane.new }

  it 'has flying status when created' do
    expect(plane).to be_flying
  end

  it 'has a flying status when flying' do
    expect(plane.status).to eq :flying
  end

  it 'can land' do
    plane.land
    plane.take_off
    expect(plane.status).to eq :landed
  end

  it 'can take off' do
    plane.land
    plane.take_off
    expect(plane.status).to eq :flying
  end
end
