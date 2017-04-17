require 'airport'

describe Airport do 
subject (:airport) { described_class.new }

	it 'has a default capacity' do
    	expect(airport.capacity).to eq Airport::DEFAULT_CAPACITY
	end


	context 'good weather' do
		let(:weather){double("weather", :stormy? => false)}
			
			it 'error when full due to capacity' do
				allow(airport).to receive(:full?) {true}
 				expect {airport.land(:plane, weather)}.to raise_error "Error: airport is full"
    		 end
    	
    		it 'should be able to confirm a plane has landed in airport once landed' do
				airport.land(:plane,weather)
				expect(airport.landed?(:plane)).to eq true
			end
			
			it 'should be able to confirm a plane has taken off' do
				airport.land('plane',weather)
				airport.take_off('plane', weather)
				expect(airport.taken_off?('plane')).to eq true
			end

			it 'should raise error if plane tries to take off having already landed' do
				airport.land('plane',weather)	
				expect{airport.land('plane',weather)}.to raise_error "Error: this plane is reported as already landed"
			end

			it 'should raise erorr if plane tries to take off having already taken off' do
				airport.land('plane',weather)
				airport.take_off('plane',weather)
				expect{airport.take_off('plane',weather)}.to raise_error "Error: this plane is reported as already in flight"
  		 end
  	end


	context 'stormy weather' do
		let(:weather){double("weather", :stormy? => true)}

			it 'should raise error if plane tries to land when stormy' do
			 expect {airport.land("plane",weather)}.to raise_error "Cannot land in stormy weather"
			end

			it 'should raise error if plane takes off when stormy' do
			expect {airport.take_off("plane",weather)}.to raise_error "Cannot take off in stormy weather"
			end

	end
		


	context 'good weather' do
		
		let(:weather){double("weather", :stormy? => false)}
			
			it 'should put plane in the airport ' do
			expect(airport.land('plane', weather)).to include ('plane')
			end

			it "should remove that plane from the airport" do
				airport.land('plane', weather)
				expect(airport.take_off('plane', weather)).not_to include ('plane')
			end		
 	end

end