require 'airport'

describe Airport do

		it { is_expected.to respond_to(:land).with(1).argument }

		it 'lands a plane' do
				plane = Plane.new
				expect(subject.land(plane)).to eq plane
		end

		it { is_expected.to respond_to(:take_off).with(2).argument }

		it 'takes off a plane' do 
				plane = Plane.new
				weather = false
				subject.land(plane)
				expect(subject.take_off(plane, weather)).to eq subject
		end

		it { is_expected.to respond_to(:stormy?) }

		describe '#take_off' do 
		it 'Ground planes when stormy' do 
			plane = Plane.new
			airport = Airport.new
			weather = true
			airport.land(plane)
			expect { subject.take_off(plane, weather) }. to raise_error "Planes grounded because of storms"
		end 
	end 

		describe "#land" do
				it "Stops planes landing when airport is at default capacity" do
					Airport:: DEFAULT_CAPACITY.times { subject.land(Plane.new) }
					expect { subject.land(Plane.new) }. to raise_error "Airport at capacity"
				end
		end 

end 
