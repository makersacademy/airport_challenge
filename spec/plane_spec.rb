require 'plane'

describe Plane do
  it { is_expected.to respond_to :lands }

  it { is_expected.to respond_to :takes_off }

  xit 'Can land' do

  end

  xit 'Has a landed status when on the ground'

  xit 'has a flying status when created'

  xit 'has a flying status when in the air'

  xit 'changes its status to flying after taking off'

end
