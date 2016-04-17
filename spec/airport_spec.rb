require 'airport'

describe Airport do 
	
	it { is_expected.to respond_to(:landing).with(1).argument }
	it { is_expected.to respond_to(:departure) }
	let(:weather){ double(:weather, :stormy? => true) }
	let(:weather1){ double(:weather, :stormy? => false) }
	let(:plane){ double(:plane) }
	let(:airport){ Airport.new(weather,15) }
	let(:airport1) {Airport.new(weather1,5)}
	
	describe '#land' do
        it 'confirms landed or not' do
    		allow(plane).to receive(:landed?).and_return(true)
    		expect(airport1.landing(plane)).to include plane
    	end	

    	it "raises error when airport is full" do 
    		allow(plane).to receive(:landed?).and_return(true)
			airport1.capacity.times { airport1.landing(plane) }
			expect{airport1.landing(plane)}.to raise_error "Airport is full"
		end

		it "Unable to land due to stormy weather" do 
			allow(weather).to receive(:stormy?).and_return true
			message = 'Unable to land due to stormy weather'
  			expect { airport.landing(plane) }.to raise_error message    		
		end

	end

	describe '#departure' do
		it 'take off from the airport' do
			plane = Plane.new
			airport1.landing(plane)
			expect(airport1.departure(plane)).to eq plane
		end
		it "unable to take off due to stormy weather" do 
			allow(weather).to receive(:stormy?).and_return true
			message = 'Unable to takeoff due to stormy weather'
  			expect {airport.departure(plane) }.to raise_error message    		
		end	
	end	
end
