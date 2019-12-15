require 'plane'

describe Plane do
    
    # Respond to a method called landed?
    it { is_expected.to respond_to :landed? }

    # Respond to a variable called landed
    it { is_expected.to respond_to :landed }
end
