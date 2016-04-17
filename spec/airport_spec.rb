require 'airport'

describe Airport do 
	let(:plane){ double :plane }
	let(:weather){double :weather}
	#let(:good_weather){ double :weather, stormy?: false}
	#let(:bad_weather){ double :weather, stormy?: true }
	subject(:airport){ described_class.new(weather, capacity = rand(100))}

	it 'landing plane' do
		allow(weather).to receive(:stormy?).and_return(false)
 		expect(airport.land(plane)).to eq [plane]
	end

	it 'plane taking off' do
		allow(weather).to receive(:stormy?).and_return(false)
		airport.land(plane)
		expect(airport.take_off(plane)).to eq plane
	end

	it 'prevent take off due to storm' do
		allow(weather).to receive(:stormy?).and_return(false)
		airport.land(plane)
		allow(weather).to receive(:stormy?).and_return(true)
		expect{airport.take_off(plane)}.to raise_error 'There is a storm occuring at the airport'
	end

	it 'prevent landing due to storm' do
		allow(weather).to receive(:stormy?).and_return(true)
		expect{airport.land(plane)}.to raise_error 'There is a storm occuring at the airport'
	end

	it 'prevent landing when airport is full' do
		allow(weather).to receive(:stormy?).and_return(false) 
		airport.capacity.times { airport.land(plane)}
		expect { subject.land(plane) }.to raise_error 'Airport full'	
	end
end
