require 'plane'

describe Plane do
	describe '#land?' do
		it {is_expected.to respond_to :landed?}
		it 'return true as plane is on airport' do
			expect(subject.landed?).to eq true
		end
	end

	describe '#new?' do
		it 'should initiliaze with landed attribute' do
			expect(subject::landed).to eq true
		end
	end

end