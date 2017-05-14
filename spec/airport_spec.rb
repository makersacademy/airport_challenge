require 'airport'
describe Airport do

  #Create Double of airplane
  let(:plane) {double :plane, landed?: false}
  it { is_expected.to respond_to(:land).with(1).argument  }
  it { is_expected.to respond_to(:take_off).with(1).argument}
  it { is_expected.to respond_to(:planes)}

  it 'returns landed planes' do
 	 subject.land(plane)
 	 expect(subject.planes).to include(plane)
  end
  
	it 'instructs a landed plane to take off and confirm it is gone' do
		subject.land(plane)
		subject.take_off(plane)
		expect(subject.planes).to_not include(plane)
	end

  it 'raises an error when there are no planes in the airport' do
  	expect {subject.take_off(plane)}.to raise_error 'No planes at the airport'
  end
	 
  it 'checks to see if a plane has landed' do
  	expect(subject.land(plane)).to eq [plane]
  end

  it 'raises an error if the airport is full' do
  	20.times {subject.land(plane)}
  	expect {subject.land(plane)}.to raise_error 'Airport full!'
  end
  

end
