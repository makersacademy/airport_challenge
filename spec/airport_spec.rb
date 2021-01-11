require 'airport'

describe Airport do

		it { is_expected.to respond_to(:land).with(2).argument }

		it { is_expected.to respond_to(:take_off).with(2).argument }

		it { is_expected.to respond_to(:stormy?) }

		it { is_expected.to respond_to(:full?) }

		describe '#take_off' do 

				it 'Ground planes when stormy' do 
						plane = Plane.new
						airport = Airport.new
						land_weather = false
						take_off_weather = true
						airport.land(plane, land_weather)
						expect { subject.take_off(plane, take_off_weather) }. to raise_error "Planes grounded because of storms"
				end 

				it 'takes off a plane' do 
					plane = Plane.new
					weather = false
					subject.land(plane, weather)
					expect(subject.take_off(plane, weather)).to eq subject
			end

		end 

		describe "#land" do

				it 'lands a plane' do
						plane = Plane.new
						weather = false
						expect(subject.land(plane, weather)).to eq plane
				end
		
				it "Stops planes landing when airport is at default capacity" do
						weather = false 
						Airport:: DEFAULT_CAPACITY.times { subject.land(Plane.new, weather) }
						expect { subject.land(Plane.new, weather) }. to raise_error "Airport at capacity"
				end

				it "Stops planes landing when wheather is stormy" do
						plane = Plane.new
						airport = Airport.new
						weather = true
						expect { subject.land(plane, weather) }. to raise_error "Planes unable to land because of storms"
				end 
		end 

		describe "#stormy?" do
				it 'should evaluate whether it is stormy or not' do
						expect(subject.stormy?).to be(true).or be(false)
				end 
		end

		describe "#full?" do
				it 'should evaluate whether the airport is full or not' do
					expect(subject.full?).to be(true).or be(false)
				end 
		end 

end 
