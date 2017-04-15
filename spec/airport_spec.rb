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
		    expect(subject.land(plane)).to eq plane
		end
	end

end
