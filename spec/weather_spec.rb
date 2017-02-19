require 'weather'
describe Weather do
	# subject(:airport){described_class.new}
	it {is_expected.to respond_to :weather}
end