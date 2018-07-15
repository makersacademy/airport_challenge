require "Airport"
describe Airport do

    # Check plane responds to land method
    it { is_expected.to respond_to(:land).with(1).argument }

    # rspeonds to take off method
    it { is_expected.to respond_to(:take_off).with(1).argument }

    # Test confirm plane no longer in hanger
   
end