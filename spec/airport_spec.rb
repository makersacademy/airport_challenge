require 'airport'
describe Airport do

  #Create Double of airplane
  let(:plane) {double :airplane}
  it { is_expected.to respond_to(:land).with(1).argument  }
  it { is_expected.to respond_to(:take_off).with(1).argument}
  it { is_expected.to respond_to(:plane)}


  it 'returns landed planes' do
 	 subject.land(plane)
 	 expect(subject.plane).to eq plane
  end
  
  
	it 'instructs a landed plane to take off and confirm it is gone' do
		subject.land(plane)
		subject.take_off(plane)
		expect(subject.plane).to eq plane
	end


	  # it 'checks to see if there are no planes initially at the airport' do
	  # 	expect(subject.planes).to eq
	  # end
	  #  has to respond to landed first
	  # describe '#take_off' do
	  	# let(:plane2) {double :plane}
  it 'raises an error when there are no planes in the airport' do
  	expect {subject.take_off(plane)}.to raise_error 'No planes at the airport'
  end
	 
  it 'checks to see if a plane has landed' do
  	subject.land(plane)
  	allow(plane).to receive(:landed?).and_return(true) 
  	expect(subject.plane).to be_landed
  end

end
