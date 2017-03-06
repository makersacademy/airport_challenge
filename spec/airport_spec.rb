require 'airport'

describe Airport do

	let(:airport) {Airport.new}
	let(:plane)   {double :plane,airborne: true,on_ground: true,in_air: true}

	context 'in good weather' do
		
		before(:each) do
			allow(airport).to receive(:stormy?).and_return false
		end

		it 'can hold multiple planes' do
		airport.capacity.times{airport.receive_plane(plane)}
		expect(airport.grounded.count).to eq 10
		end

		it 'has a default capacity' do
			airport.capacity.times{airport.receive_plane(plane)}
			expect{airport.receive_plane(plane)}.to raise_error("The airport is full!")
		end

		describe '#receieve_plane' do
			it 'allows planes to land in good weather' do
				expect(airport.receive_plane(plane)).to eq [plane]
			end

			it 'allows planes to land after take off' do
				airport.receive_plane(plane)
				airport.release_plane(plane)
				expect(airport.receive_plane(plane)).to eq [plane]
			end

			it 'raises an error when airport is full' do
				airport.capacity.times{airport.receive_plane(plane)}
		 		expect{airport.receive_plane(plane)}.to raise_error("The airport is full!")
			end

			it 'raises an error when a plane is already grounded' do
				allow(plane).to receive(:airborne).and_return false
				expect{airport.receive_plane(plane)}.to raise_error("That plane is already grounded!")
			end
		end

		describe '#release_plane' do

			it 'allows planes to leave airport in good weather' do
				airport.receive_plane(plane)
				expect(airport.release_plane(plane)).to eq plane
			end

			it 'raises and error when plane is not present' do
				expect{airport.release_plane(plane)}.to raise_error("That plane is not in the airport!")
			end

		end

	end

	context 'in bad weather' do
		
		before(:each) do
			allow(airport).to receive(:stormy?).and_return true
		end
	
		describe '#receive_plane' do
	
			it 'raises an error when stormy' do
				expect{airport.receive_plane(plane)}.to raise_error("Planes cannot land during storms!") 
			end
		end

		describe '#release_plane' do

			it 'raises an error when stormy' do
				expect{airport.release_plane(plane)}.to raise_error("Planes cannot take off during storms!")
			end

		end	

	end

end