require 'plane'

describe Plane do
    it { is_expected.to respond_to(:land).with(1).argument }
    it { is_expected.to respond_to(:takeoff).with(1).argument}    
end
