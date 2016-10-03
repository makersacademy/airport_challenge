require 'airport.rb'

describe Airport do
	subject(:airport) { described_class.new(20) }
	let(:plane) {double :plane}

	describe '#land' do
		context 'when clear weather' do
			it 'instructs a plane to land' do
				allow(airport).to receive(:stormy?).and_return false
				expect(airport).to respond_to(:land).with(1).argument
			end
		context 'when at full' do
			it 'does not allow landing when full' do
				allow(airport).to receive(:stormy?).and_return false
				20.times { airport.land(plane) }
				expect { airport.land(plane) }.to raise_error 'Airport full'
			end
		end
	end
	context 'when stormy' do
		it 'raises an error' do
			allow(airport).to receive(:stormy?).and_return true
			expect {airport.land(plane)}.to raise_error 'Cannot land plane! Too stormy!'
		end
	end


end


	describe '#take off' do
	it 'instruts a plane to take off' do
		expect(airport).to respond_to(:take_off).with(1).argument
	end
end



end
