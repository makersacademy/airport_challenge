require 'plane'

describe Plane do
  let(:plane) {Plane.new}

  it 'has a flying status when created' do
    expect(plane.status).to eq 'flying'
  end

  it 'has a flying status when in the air' do
    expect(plane.location).to eq 'air'
  end



  # xit 'can take off'
  #
  # xit 'changes its status to flying after taking off'

end
