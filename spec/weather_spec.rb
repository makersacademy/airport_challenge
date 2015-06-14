require 'weather'

describe Weather do
	it 'Responds to Sunny?' do
		expect(subject).to respond_to :Sunny?
	end	

	it 'Responds to Stormy?' do 
		expect(subject).to respond_to :Stormy?
	end

   
	it 'Sunny returns true when generator is less than 80' do 
	 allow(subject).to receive(:generator){50}
		expect(subject.Sunny?).to eq true
	end

	it 'Stormy return false when generator is less than 80' do 
		 allow(subject).to receive(:generator){50}
		expect(subject.Stormy?).to eq false
	end


	it'Sunny? must return false when generator is over 80' do 
		allow(subject).to receive(:generator){90}
		expect(subject.Sunny?).to eq false
	end

	it 'Stormy? must return true when generator is over 80' do 
		allow(subject).to receive(:generator){90}
		expect(subject.Stormy?).to eq true
	end



end