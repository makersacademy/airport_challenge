require 'plane'

describe Plane do

  context 'does exist?' do
    it { is_expected.to respond_to :yes }
  end 
end
