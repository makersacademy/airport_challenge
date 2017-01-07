require 'airport'

describe Airport do
  let(:landed_plane) {double :plane, landed?: true}
  let(:air_plane) {double :plane, landed?: false}


	describe '#land' do
		it {is_expected.to respond_to(:land).with(1).argument}
		
		it 'should return plane is landed if weather is sunny' do
			allow(subject).to receive(:stormy?) {false}
			expect{subject.land(air_plane).to eq true}
		end
		
		it 'should return plane is not landed if weather is stormy' do
			allow(subject).to receive(:stormy?) {true}
			expect{subject.land(air_plane).to eq false}
		end

		it 'should not allow plane to land if capacity is zero' do
			allow(subject).to receive(:full?) {true}
			expect{subject.land(air_plane)}.to raise_error('Airport is full')
		end

		it 'should allow plane to land if capacity is not zero' do
			allow(subject).to receive(:full?) {false}
			expect{subject.land(air_plane).to eq true}
		end

		it 'should add plane to planes' do
			allow(subject).to receive(:full?) {false}
			allow(subject).to receive(:stormy?) {false}
			expect{subject.land(air_plane).to eq true}
			expect{(subject::planes.count).to eq 1}
		end

	end

	describe '#take_off' do
		it {is_expected.to respond_to(:take_off).with(1).argument}
		it 'should return plane is taken off if weather is sunny' do
			allow(subject).to receive(:stormy?) {false}
			expect{subject.take_off(landed_plane).to eq false}
		end

		it 'should return plane is not taken if weather is stormy' do
			allow(subject).to receive(:stormy) {true}
			expect{subject.take_off(landed_plane).to eq false}
		end
	
		it 'should raise error before take off about stormy weather 'do
			allow(subject).to receive(:stormy?) {true}
			expect{subject.take_off(landed_plane)}.to raise_error('Weather is stormy, cannot take off')
		end

		/it 'should remove plane from planes' do
			allow(subject).to receive(:stormy?) {false}
			subject.take_off(landed_plane)
		#to add a line to test array or count once a plane is has taken off
		end/

	end

	describe '#new_instance' do
		it {is_expected.to respond_to(:capacity)}

		it 'should return 10 if no capacity is given' do
			expect{(Airport.new::capacity).to eq subject::DEFAULT_CAPACITY}
		end

		it ' airport default capacity should return 10 if no capacity is given' do
			expect{subject::DEFAULT_CAPACITY.to eq 10}
		end

		it 'shoud return the given value if capacity is given' do
			
			expect{(Airport.new(12)::capacity).to eq 18}
		end

	
	end

end