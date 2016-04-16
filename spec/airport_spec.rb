require 'airport'
require 'plane'

describe Airport do

  it {is_expected.to respond_to(:land).with(1).argument}
  it {is_expected.to respond_to(:takeoff).with(1).argument}

  describe '#land plane' do

      end
  end

end
