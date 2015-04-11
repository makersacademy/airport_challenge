require 'plane'

describe Plane do
  let(:plane) { Plane.new }

  it 'has a flying status when created' do
    expect(plane).to be_flying
  end

  xit 'has a flying status when in the air'

  xit 'can take off'

  xit 'changes its status to flying after taking off'

end
