require 'airport'

describe Airport do
	let(:plane)         { double("Plane", :landed? => true) }
	let(:capacity)      { Airport::DEFAULT_CAPACITY }
	let(:small_airport) { Airport.new(1) }
 	let(:storm)         { subject.instance_variable_set(:@stormy, true) }
 	let(:sunny)         { subject.instance_variable_set(:@stormy, false) }
 	let(:smallsunny)	{ small_airport.instance_variable_set(:@stormy, false) }	
 	let(:confirmlanded) { "Confirming that plane has landed." }
 	let(:noplane) 		{ "No such plane is presently at the airport." } 
 	let(:stormytakeoff) { "The weather is too harsh for a safe take-off!" }
 	let(:stormylanding) { "The weather is too harsh for a safe landing, please circle back. Over." }
 	let(:full)          { "The airport is full! Circle until a plane has taken off. Over." }
 	let(:already_landed){ "That plane has already landed at this airport!" }

	describe '#initialize' do
		it 'initializes an airport with a default capacity' do
			expect(subject.instance_variable_get(:@capacity)).to eq 100
		end

		it 'default airport capacity can be overridden as appropriate' do
			small_airport.accept("plane")
			expect{ smallsunny; small_airport.accept(plane)}.to raise_error(full)
		end
	end

	describe '#accept(plane)' do
		it 'instructs a plane to land at the airport' do
			subject.accept(plane)
			expect(subject.plane_status(plane)).to eq confirmlanded
		end

		it 'prevents landing when weather is stormy' do 
			storm
			expect{subject.accept(plane)}.to raise_error(stormylanding)
		end

		it 'prevents landing when the airport is full' do
			airport = Airport.new(1)
			sunny
			airport.accept(plane)
			expect{airport.accept("plane")}.to raise_error(full)
		end

		it 'prevents landing when that plane has already landed at this airport' do
			subject.accept(plane)
			expect{subject.accept(plane)}.to raise_error(already_landed)
		end
	end

	describe '#confirm_takeoff(plane)' do
		it 'instructs a plane to take off from the airport' do
			subject.accept(plane)
			sunny 
			subject.confirm_takeoff(plane)
			expect(subject.plane_status(plane)).to eq noplane
		end

		it 'prevents take-off when weather is stormy' do
			subject.accept(plane)
			storm
			expect{subject.confirm_takeoff(plane)}.to raise_error(stormytakeoff)
		end

		it 'prevents take-off if the plane is not at this airport' do
			expect{subject.confirm_takeoff(plane)}.to raise_error(noplane)
		end
	end

	describe '#plane_status(plane)' do 
		it 'confirms that a plane has landed' do
			subject.accept(plane)
			expect(subject.plane_status(plane)).to eq confirmlanded
		end

		it 'confirms that a plane has taken off' do
			subject.accept(plane)
			sunny
			subject.confirm_takeoff(plane)
			expect(subject.plane_status(plane)).to eq noplane
		end
	end
end