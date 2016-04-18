require 'airport'

describe Airport do 

	subject(:airport) {described_class.new}
	let(:airport2) {described_class.new(10)}
	let(:sunny_weather) {allow(subject).to receive(:current_weather).and_return(:sunny)}
	let(:stormy_weather) {allow(subject).to receive(:current_weather).and_return(:stormy)}
	let(:plane) { double(:plane, landed?:false,land: nil)}


	describe 'landing' do
		it 'plane to land' do
			sunny_weather
			expect(plane).to receive(:land)
			subject.land plane
		end

		it 'has the plane at the airport aftering landing' do
			sunny_weather
			subject.land plane
			expect(subject.planes).to include(plane)
		end

		it 'expect error when instructing plane to land during storm' do
			stormy_weather
			error = "Bad weather! Too dangerous to land plane."
			expect{subject.land plane}.to raise_error(error)
		end
	end

	describe 'take off' do
		before {allow(plane).to receive_messages(landed?:true,land:nil)	}

		it {expect(subject).to respond_to(:take_off).with(1).argument }

		it 'no longer has the plane at the airport' do
			sunny_weather
			subject.land plane
			subject.take_off plane
			expect(subject.planes).not_to include(plane)
		end

		it 'expect error when take_off during storm' do
			sunny_weather
			allow(plane).to receive(:landed?).and_return(false)
			subject.land plane
			stormy_weather
			error = "Bad weather! Too dangerous to take off."
			expect{subject.take_off plane}.to raise_error(error)
		end

		it 'display message if trying to take off when plane already landed elsewhere' do
			sunny_weather
			allow(plane).to receive(:landed?).and_return(true)
			allow(airport2).to receive(:current_weather).and_return(:sunny)
			airport2.land plane
			expect(subject.take_off plane).to eq("This plane is not at this airport!")
		end
	end

	describe 'capacity' do
		it 'expects error when landing with full airport' do
			sunny_weather
		    5.times do
		 	    planes =  double(:plane,landed?:false,land:nil)
				subject.land planes
			end
			expect{subject.land plane}.to raise_error("Cannot land. Airport is full!")
		end

		it 'expects to have a default capacity' do
			expect(subject.capacity).to eq described_class::CAPACITY
		end

		it 'expects capacity to be changed' do
			expect(airport2.capacity).not_to eq described_class::CAPACITY
		end
	end

end




