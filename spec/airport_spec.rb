require 'airport'

describe Airport do
		plane = Plane.new
	describe 'landing plane' do


      it 'confirms the plane has landed' do
      	subject.land(plane)
        expect(subject.planes.length).to eq 1
      end

		it 'plane status is landed when it lands' do
		subject.land(plane)
		expect(plane.landed?).to eq true
		end

		it 'plane does not land when airport is full' do
			subject.land(plane)
				expect{subject.land(plane)}.to raise_error ('Sorry the airport is full')
		end
			

end

	describe 'taking off plane' do
		plane = Plane.new

		it 'planes leaves airport when taken off' do
			subject.land(plane)
			subject.takeoff(plane)
			expect(subject.planes.length).to eq 0
		end

		it 'plane status is flying when taken off' do
			subject.land(plane)
			subject.takeoff(plane)
			expect(plane.takenoff?).to eq false
		end
	end

end