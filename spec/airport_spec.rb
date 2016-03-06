require 'airport'

describe Airport do

	describe 'landing plane' do

plane = Plane.new
      it 'confirms the plane has landed' do
      	subject.land(plane)
        expect(subject.planes.length).to eq 1
      end

		it 'plane status is landed when it lands' do
		subject.land(plane)
		expect(plane.landed?).to eq true
		end
end

	describe 'taking off plane' do

		it 'planes leaves airport when taken off' do
		end

		it 'plane status is flying when taken off' do
		end
	end

end