require 'airport'

describe Airport do
  subject(:airport) { described_class.new(capacity: 100) }
  let(:plane) { double :plane }

  describe '#land' do

	context 'when it is sunny' do
		before { allow(airport).to receive(:stormy?).and_return(false) }

		it 'contains the plane after landing' do
			airport.land plane
			expect(airport.land(plane).last).to eq plane
		end
	
		it 'raises an error when the airport is full' do
			100.times { airport.land plane }
			expect { airport.land plane }.to raise_error 'Airport is full!'
		end
	end

	context 'when it is stormy' do
		before { allow(airport).to receive(:stormy?).and_return(true) }
		
		it 'raises an error when the weather is stormy' do
			expect{airport.land(plane)}.to raise_error "It's too stormy to land!"
		end
	end

  end

  describe '#depart' do
	context 'when it is sunny' do
		before { allow(airport).to receive(:stormy?).and_return(false) }

		it 'no longer contains the plane after departure' do
			airport.land plane
			airport.depart plane
			expect(airport.planes).not_to include(plane)
		end
		it "raises an error when airport doesn't contain the plane" do
			expect { airport.depart plane }.to raise_error "That plane isn't here!"
		end
	end

	context 'when it is rainy' do

		it 'raises an error when it is stormy' do
			allow(airport).to receive(:stormy?).and_return(false)
			airport.land plane
			allow(airport).to receive(:stormy?).and_return(true)
			expect { airport.depart plane }.to raise_error "It's too stormy to takeoff!"
		end
	end
  end

end
