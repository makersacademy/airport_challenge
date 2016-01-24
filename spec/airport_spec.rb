require 'airport'

describe Airport do
	it {is_expected.to respond_to(:allow_takeoff)}

    it 'raises error message when airport full' do
		plane = (double :plane)
		Airport::DEFAULT_CAPACITY.times {subject.allow_landing(plane)}
		expect {subject.allow_landing(plane)}.to raise_error("Airport is full")
	end


	it {is_expected.to respond_to(:allow_landing).with(1).argument}

	it 'returns landed planes' do
		plane = (double :plane)
		a =  subject.allow_landing(plane)
		expect(subject.instance_variable_get(:@planes)).to eq(a)
	end


	it {is_expected.to respond_to(:full?)}

	describe '#allows takeoff' do

		it 'raises error when there are no planes in airport' do
	    expect {subject.allow_takeoff}.to raise_error("No planes available for takeoff")
    end
    end
 #    	it 'allows takeoff' do
	# 	plane = (double :plane)
	# 	subject.allow_takeoff
	# 	expect(plane).to be_airborne

	# end
	context "when a default is specified" do
		it 'has a default capacity' do
			expect(subject.capacity).to eq Airport::DEFAULT_CAPACITY
		end
	end

end
	