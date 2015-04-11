require 'plane'

describe Plane do
  let(:plane) { Plane.new }

  it 'has a flying status when created' do
    expect(plane).to be_flying
  end

  it 'has a flying status when flying' do
    expect(plane.status).to eq :flying
  end

  it 'can land' do
    plane.land
    expect(plane.status).to eq :landed
  end

  xit 'can take off'

  xit 'changes its status to flying after taking off'

end
