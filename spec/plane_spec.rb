require 'plane'

describe Plane do

	describe '#new?' do
		it 'should return true on land method' do
			expect(subject.landed).to eq true
		end
	end

end