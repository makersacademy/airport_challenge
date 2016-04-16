require 'airport'

describe Airport do 
	let(:plane){ double :plane }
	let(:weather){ double :weather, stormy?: true }
	subject(:airport){ described_class.new}

	it 'landing plane' do
 		expect(airport.land(plane)).to eq [plane]
	end

	it 'plane taking off' do
		airport.land(plane)
		expect(airport.take_off(plane)).to eq plane
	end

	it 'prevent take off' do
		airport.land(plane)
		weather.stormy?
		expect{airport.take_off(plane)}.to raise_error 'There is a storm occuring'
	end  
end


