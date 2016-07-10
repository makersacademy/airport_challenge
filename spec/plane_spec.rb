require 'plane'

describe Plane do

  describe '#land' do

    it {is_expected.to respond_to(:landed).and respond_to(:landed?)}

  end

end
