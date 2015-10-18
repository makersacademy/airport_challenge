require 'weather'

describe Weather do
	let(:random_outlook) { double :random_outlook}

	it "It returns whether it is stormy or not" do
		allow(random_outlook).to receive(:stormy)
		expect(subject.stormy?).to eq true
	end
end