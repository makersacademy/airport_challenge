require 'airport'

describe Airport do
	it {is_expected.to respond_to(:allow_takeoff)}

	it 'allows takeoff' do
		plane = subject.allow_takeoff
		expect(plane).to be_airborne

	end

	it 'raises error message when airport full' do
		plane = (double :plane)
		expect {(subject.allow_landing(plane))}.to raise_error("Airport is full, cannot allow plane to land")
	end


	it {is_expected.to respond_to(:allow_landing).with(1).argument}

	it 'returns landed planes' do
		plane = (double :plane)
		subject.allow_landing(plane)
		expect(subject.plane).to eq(plane)
	end


	it {is_expected.to respond_to(:full?)}

end
	