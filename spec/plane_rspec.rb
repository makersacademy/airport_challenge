require 'plane'

describe Plane do
	it {is_expected.to respond_to :land?}

	it 'return true once plane landed on airport' do
		airport = Airport.new
		expect(subject.land?).to eq true
	end

end