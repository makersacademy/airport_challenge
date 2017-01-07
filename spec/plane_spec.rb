require 'plane'

describe Plane do

	describe '#new?' do
		it 'should initiliaze with landed attribute' do
			expect(subject::landed).to eq true
		end
	end

end