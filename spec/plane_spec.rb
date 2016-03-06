require 'plane'

describe Plane do

  describe 'landed?'

    it 'expects it to be able to confirm if a plane is landed' do
      is_expected.to respond_to(:landed?)
    end

  end

end
