require 'plane'

describe Plane do

  context 'responds to' do

    it { is_expected.to respond_to :flying }
    it { is_expected.to respond_to :flying= }

  end

end
