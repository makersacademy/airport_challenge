require 'plane'

describe Plane do
  context 'confirms plane has "landed?"' do
    it {is_expected.to respond_to :landed?}
  end
end
