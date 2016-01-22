require 'plane'

describe Plane do
  subject(:plane) {described_class.new}

  context 'it has the basic methods expected of it' do
    it{is_expected.to respond_to(:land)}
    # Plane should have a .land method
    it{is_expected.to respond_to(:takeoff)}
    # Plane should have a .takeoff method
  end

  context '...and those methods do what they are supposed to' do
    #code here
  end

end
