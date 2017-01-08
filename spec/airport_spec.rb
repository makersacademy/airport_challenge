require 'airport'

describe Airport do

	
	context 'in good weather' do
		
		before(:each) do
			allow(subject).to receive(:stormy?).and_return false
		end

		it 'can hold multiple planes' do
		subject.capacity.times{subject.receive_plane(Plane.new)}
		expect(subject.grounded.count).to eq 10
		end

		it 'has a default capacity' do
			subject.capacity.times{subject.receive_plane(Plane.new)}
			expect{subject.receive_plane(Plane.new)}.to raise_error("The airport is full!")
		end

		describe '#receieve_plane' do
			it 'allows planes to land in good weather' do
				plane = Plane.new
				expect(subject.receive_plane(plane)).to eq [plane]
			end

			it 'allows planes to land after take off' do
				plane = Plane.new
				subject.receive_plane(plane)
				subject.release_plane(plane)
				expect(subject.receive_plane(plane)).to eq [plane]
			end

			it 'raises an error when airport is full' do
				subject.capacity.times{subject.receive_plane(Plane.new)}
		 		expect{subject.receive_plane(Plane.new)}.to raise_error("The airport is full!")
			end

			it 'raises an error when a plane is already grounded' do
				plane = Plane.new
				subject.receive_plane(plane)
				expect{subject.receive_plane(plane)}.to raise_error("That plane is already grounded!")
			end
		end

		describe '#release_plane' do

			it 'allows planes to leave airport in good weather' do
				plane = Plane.new			
				subject.receive_plane(plane)
				expect(subject.release_plane(plane)).to eq plane
			end

			it 'raises and error when plane is not present' do
				plane = Plane.new
				expect{subject.release_plane(plane)}.to raise_error("That plane is not in the airport!")
			end

		end

	end

	context 'in bad weather' do
		
		before(:each) do
			allow(subject).to receive(:stormy?).and_return true
		end
	
		describe '#receive_plane' do
	
			it 'raises an error when stormy' do
				expect{subject.receive_plane(Plane.new)}.to raise_error("Planes cannot land during storms!") 
			end
		end

		describe '#release_plane' do

			it 'raises an error when stormy' do
				plane = Plane.new
				expect{subject.release_plane(plane)}.to raise_error("Planes cannot take off during storms!")
			end

		end	

	end

end