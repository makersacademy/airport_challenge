require 'plane'

describe Plane do

  it 'expects it to be able to confirm if a plane is landed' do
    is_expected.to respond_to(:landed?)
  end

end
