require 'airport'

describe Airport do
  let(:plane) { double :plane }

  describe '#land' do

	context 'when it is sunny' do
		before { allow(subject).to receive(:stormy?).and_return(false) }

		it 'contains the plane after landing' do
			subject.land plane
			expect(subject.land(plane).last).to eq plane
		end
	
		it 'raises an error when the airport is full' do
			subject.capacity.times { subject.land plane }
			expect { subject.land plane }.to raise_error 'Airport is full!'
		end
	end

	context 'when it is stormy' do
		before { allow(subject).to receive(:stormy?).and_return(true) }
		
		it 'raises an error when the weather is stormy' do
			expect{subject.land(plane)}.to raise_error "It's too stormy to land!"
		end
	end

  end

  describe '#depart' do
	context 'when it is sunny' do
		before { allow(subject).to receive(:stormy?).and_return(false) }

		it 'no longer contains the plane after departure' do
			subject.land plane
			subject.depart plane
			expect(subject.planes).not_to include(plane)
		end
		it "raises an error when airport doesn't contain the plane" do
			expect { subject.depart plane }.to raise_error "That plane isn't here!"
		end
	end

	context 'when it is rainy' do

		it 'raises an error when it is stormy' do
			allow(subject).to receive(:stormy?).and_return(false)
			subject.land plane
			allow(subject).to receive(:stormy?).and_return(true)
			expect { subject.depart plane }.to raise_error "It's too stormy to takeoff!"
		end
	end
  end

end
