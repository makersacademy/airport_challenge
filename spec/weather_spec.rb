require 'weather'

describe Weather do

	context '#stormy?' do
		it 'should return true or false' do
			expect([true,false]).to include subject.stormy?
		end
		it 'should return false more than true' do
			array = []
			100.times { array << subject.stormy? }
			expect(array.count(false) > array.count(true))
		end
	end

end