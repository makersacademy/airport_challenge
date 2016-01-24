require 'weather'

describe Weather do
	it {is_expected.to respond_to(:stormy?)}

	it 'is expected to return true when passed 1' do
		allow(subject).to receive(:value) {1}
		expect(subject.stormy?).to eq(true)
	end
	it 'is expected to return false when not passed 2..10' do
	    allow(subject).to receive(:value).and_return(2,3,4,5,6,7,8,9,10)
	    expect(subject.stormy?).to eq(false)
	end	
end