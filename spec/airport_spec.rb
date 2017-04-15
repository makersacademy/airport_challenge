require 'Airport'

describe Airport do

	describe :new do 
		subject {Airport}
		it 'Should return instance of Airport when initialized' do
			expect(subject).to respond_to(:new)
		end
	end

	describe  '#land' do
		plane = Plane.new

		it "Should accept one plane as a parameter" do
		    expect { subject.land(plane) }.to_not raise_error   
		end

		it "Should not accept more than one plane as parameters" do
		    expect { subject.land(plane, plane) }.to raise_error(ArgumentError)
		end

		it "Should confirm that a plane has landed" do
		    expect(subject.land(plane)).to eq [subject.landed.last]
		end
	end

	describe  '#takeoff' do
		plane = Plane.new
		airport =  Airport.new 
		airport.land(plane) 

		it "Should recognise method without a parameter" do
		    expect { airport.takeoff }.to_not raise_error   
		end

		it "Should not accept a parameter" do
		    expect { airport.takeoff(plane) }.to raise_error(ArgumentError)
		end

		it "Should confirm that a plane has taken off" do
			airport.takeoff
		    expect(airport.landed.include?(plane.id)).to be_falsey
		end
	end


end
