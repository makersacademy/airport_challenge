require 'airport'

describe Airport do
	let(:plane)    {double("Plane", :landed? => true)}
	let(:capacity) {Airport::DEFAULT_CAPACITY}

	describe '#initialize' do
		it 'initializes an airport with a default capacity' do
			(1..100).to_a.each{|x| subject.instance_variable_set(:@stormy, false); subject.accept(x)}
			expect{subject.instance_variable_set(:@stormy, false); subject.accept(plane)}.to raise_error("The airport is full! Circle until a plane has taken off. Over.")
		end

		it 'default airport capacity can be overridden as appropriate' do
			airport20 = Airport.new(20)
			(1..20).to_a.each{|x| airport20.instance_variable_set(:@stormy, false); airport20.accept(x)}
			
			expect{ airport20.instance_variable_set(:@stormy, false); airport20.accept(plane)}.to raise_error("The airport is full! Circle until a plane has taken off. Over.")
		end
	end

	describe '#accept(plane)' do
		it 'instructs a plane to land at the airport' do
			subject.accept(plane)
			expect(subject.plane_status(plane)).to eq "Confirming that that plane has landed."
		end

		it 'prevents landing when weather is stormy' do 
			subject.instance_variable_set(:@stormy, true)
			expect{subject.accept(plane)}.to raise_error("The weather is too harsh for a safe landing, please circle back. Over.")
		end

		it 'prevents landing when the airport is full' do
			airport = Airport.new(1)
			airport.accept(plane)
			expect{airport.accept("plane")}.to raise_error("The airport is full! Circle until a plane has taken off. Over.")
		end

		it 'prevents landing when that plane has already landed at this airport' do
			subject.accept(plane)
			expect{subject.accept(plane)}.to raise_error("That plane has already landed at this airport!")
		end
	end

	describe '#confirm_takeoff(plane)' do
		it 'instructs a plane to take off from the airport' do
			subject.accept(plane)
			subject.confirm_takeoff(plane)
			expect(subject.plane_status(plane)).to eq "No such plane is presently at the airport."
		end

		it 'prevents take-off when weather is stormy' do
			subject.accept(plane)
			subject.instance_variable_set(:@stormy, true)
			expect{subject.confirm_takeoff(plane)}.to raise_error("The weather is too harsh for a safe take-off!")
		end

		it 'prevents take-off if the plane is not at this airport' do
			expect{subject.confirm_takeoff(plane)}.to raise_error("No such plane is presently at the airport.")
		end
	end

	describe '#plane_status(plane)' do 
		it 'confirms that a plane has landed' do
			subject.accept(plane)
			expect(subject.plane_status(plane)).to eq "Confirming that that plane has landed."
		end

		it 'confirms that a plane has taken off' do
			subject.accept(plane)
			subject.confirm_takeoff(plane)
			expect(subject.plane_status(plane)).to eq "No such plane is presently at the airport."
		end
	end
end