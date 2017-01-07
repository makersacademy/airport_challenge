require 'airport'

describe Airport do
 
 let(:plane) {double :plane}

	describe '#land' do
		it {is_expected.to respond_to(:land).with(1).argument}
		
		it 'should return plane is landed if weather is sunny' do
			allow(subject).to receive(:stormy?) {false}
			expect{subject.land(plane).to eq true}
		end
		
		it 'should return plane is not landed if weather is stormy' do
			allow(subject).to receive(:stormy?) {true}
			expect{subject.land(plane).to eq false}
		end

		it 'should not allow plane to land if capacity is zero' do
			allow(subject).to receive(:full?) {true}
			expect{subject.land(plane)}.to raise_error('Airport is full')
		end

		it 'should allow plane to land if capacity is not zero' do
			allow(subject).to receive(:full?) {false}
			expect{subject.land(plane).to eq true}
		end

		it 'should allow plane to land if planes count is not zero' do
			allow(subject).to receive(:full?) {false}
			expect{subject.land(plane).to eq true}
		end


		it 'should add one to planes array' do
			allow(subject).to receive(:full?) {false}
			allow(subject).to receive(:stormy?) {false}
			expect(subject.planes).to eq subject.land(plane)
		end

	end

	describe '#take_off' do
		it {is_expected.to respond_to(:take_off).with(1).argument}
		it 'should return plane is taken off if weather is sunny' do
			allow(subject).to receive(:stormy?) {false}
			expect{subject.take_off(plane).to eq false}
		end

		it 'should return plane is not taken if weather is stormy' do
			allow(subject).to receive(:stormy) {true}
			expect{subject.take_off(plane).to eq false}
		end
	
		it 'should raise error before take off about stormy weather 'do
			allow(subject).to receive(:stormy?) {true}
			expect{subject.take_off(plane)}.to raise_error('Weather is stormy, cannot take off')
		end

		it 'should remove plane from planes' do
			allow(subject).to receive(:stormy?) {false}
			subject.land(plane)
			subject.take_off(plane)
			expect{(subject.planes).to eq []}
		end

	end

	describe '#initialize' do
		it {is_expected.to respond_to(:capacity)}

		context 'return defaults' do
			it 'should return 10 if no capacity is given' do
				expect{(Airport.new::capacity).to eq subject::DEFAULT_CAPACITY}
			end

			it ' airport default capacity should return 10 if no capacity is given' do
			expect(Airport.new).to have_attributes(:capacity => 10)
			end

		end

			it 'shoud return 12' do
			expect(Airport.new(12)).to have_attributes(:capacity => 12)
			end
	end

end