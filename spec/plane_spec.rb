require 'plane'

describe Plane do
	subject(:plane) { described_class.new }

	it { is_expected.to respond_to(:has_landed?) }
	it { is_expected.to respond_to(:is_flying?) }
end