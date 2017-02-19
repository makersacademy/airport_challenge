require 'plane'
describe Plane do
	# subject(:plane){described_class.new}
	# let(:airport){double :airport}
	it {is_expected.to respond_to :takeoff}
	it {is_expected.to respond_to :grounded}

end