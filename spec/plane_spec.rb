require 'plane'

describe Plane do

	describe '#new?' do
		it 'should initiliaze with landed equals to true' do
			expect(subject.landed).to eq true
		end
	end

end