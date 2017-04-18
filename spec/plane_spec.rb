describe Plane do
	let(:airport) { double("Airport", accept: true, confirm_takeoff: true) }
	
	describe '#land(airport)' do 
		it 'responds to land' do
			expect(subject).to respond_to(:land)
		end

		it 'expects the plane status to be landed if it has landed' do
			subject.land(airport)
			expect(subject.instance_variable_get(:@landed)).to eq true
		end

		it 'prevents landing if the plane has already landed' do 
			subject.land(airport)
			expect{subject.land(airport)}.to raise_error("This plane is already on the ground, Captain!")
		end
	end 

	describe '#takeoff(airport)' do
		it 'responds to takeoff' do
			expect(subject).to respond_to(:takeoff)
		end

		it 'expects the plane status to be flying if it has taken off' do
			expect(subject.instance_variable_get(:@landed)).to eq false
		end

		it 'prevents take-off if the plane is already flying' do
			expect{subject.takeoff(airport)}.to raise_error("We've already taken off, Sir! Are you feeling alright?")
		end
	end
end