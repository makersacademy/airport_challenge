require 'airport'

describe Airport do 


	it {is_expected.to respond_to(:take_off).with(2).argument}

	it {is_expected.to respond_to(:land).with(2).argument}

	it {is_expected. to respond_to(:full?)}

	it 'has a default capacity' do
    	expect(subject.capacity).to eq Airport::DEFAULT_CAPACITY
	end

	context 'full' do
		let(:weather){double("weather", :stormy? => false)}
	it 'error when full due to capacity' do
		subject.capacity.times{subject.land('plane', weather)}
 		expect {subject.land('plane', weather)}.to raise_error("Error: airport is full")
     end
    end



	context 'stormy weather' do
		let(:weather){double("weather", :stormy? => true)}

			it 'should raise error if plane tries to land when stormy' do
			 expect {subject.land("plane",weather)}.to raise_error "Cannot land in stormy weather"
			end

			it 'should raise error if plane takes off when stormy' do
			expect {subject.take_off("plane",weather)}.to raise_error "Cannot take off in stormy weather"
			end

	end
		


	context 'good weather' do
		
		let(:weather){double("weather", :stormy? => false)}
			
			it 'should put plane in the airport ' do
			expect(subject.land('plane', weather)).to include ('plane')
			end

			it "should remove that plane from the airport" do
				subject.land('plane', weather)
				expect(subject.take_off('plane', weather)).not_to include ('plane')
			end		
 	end

end