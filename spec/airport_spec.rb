require 'airport'

describe Airport do
  let(:plane) {double :plane, landed?: true}


	describe '#land' do
		it {is_expected.to respond_to(:land).with(1).argument}
		it 'should return plane is landed if weather is sunny' do
			allow(subject).to receive(:stormy?) {false}
			expect{subject.land(plane).to eq true}
			end

		it 'should raise error before landing about stormy weather ' do
			allow(subject).to receive(:stormy?) {true}
			expect{subject.land(plane)}.to raise_error('Weather is stormy, cannot land')
			end

	end

	describe '#take_off' do
		it {is_expected.to respond_to(:take_off).with(1).argument}
		it 'should return plane is taken off if weather is sunny' do
			allow(subject).to receive(:stormy?) {false}
			expect{subject.take_off(plane).to eq false}
			end	
	
		it 'should raise error before take off about stormy weather 'do
			allow(subject).to receive(:stormy?) {true}
			expect{subject.take_off(plane)}.to raise_error('Weather is stormy, cannot take off')
			end

	end

end