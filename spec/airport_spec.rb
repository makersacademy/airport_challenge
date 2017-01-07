require 'airport'

describe Airport do
  let(:plane) {double :plane, landed?: true}


	describe '#land' do
		it {is_expected.to respond_to(:land).with(1).argument}
		it 'should return plane is landed if weather is sunny' do
			allow(subject).to receive(:stormy?) {false}
			expect{subject.land(plane).to eq true}
		end
		
		it 'should add plane to planes' do
			allow(subject).to receive(:stormy?) {false}
			subject.land(plane)
			/to add a line to test array or count once a plane is landed/
		end
		
		it 'should return plane is not landed if weather is stormy' do
			allow(subject).to receive(:stormy?) {true}
			expect{subject.land(plane).to eq false}
		end

		it 'should not allow plane to land if capacity is zero' do
			allow(subject).to receive(:full?) {true}
			expect{subject.land(plane)}.to raise_error('Airport is full')
		end


	end

	describe '#take_off' do
		it {is_expected.to respond_to(:take_off).with(1).argument}
		it 'should return plane is taken off if weather is sunny' do
			allow(subject).to receive(:stormy?) {false}
			expect{subject.take_off(plane).to eq false}
		end

		it 'should remove plane from planes' do
			allow(subject).to receive(:stormy?) {false}
			subject.land(plane)
			/to add a line to test array or count once a plane is has taken off/
		end
	
		it 'should raise error before take off about stormy weather 'do
			allow(subject).to receive(:stormy?) {true}
			expect{subject.take_off(plane)}.to raise_error('Weather is stormy, cannot take off')
		end

	end

	describe '#new_instance' do
		it 'should return 0 if no capacity is given' do
			expect{(subject::capacity).to eq 0}
		end
		it 'shoud return the given value if capacity is given' do
			expect{(subject(12)::capacity).to eq 12}
		end
	end

end