require 'airport'

describe Airport do

  #Create Double of airplane
  let(:plane) 	{double :plane, :landed= => false, landed?: false}
  let(:weather)	{double :weather, :sunny= => true, sunny?: true}

  # before :each do
  #   airport.sunny = true
  # end

  it { is_expected.to respond_to(:land).with(1).argument  }
  it { is_expected.to respond_to(:take_off).with(1).argument}
  it { is_expected.to respond_to(:planes)}
  it { is_expected.to respond_to(:capacity)}

  it 'returns landed planes' do
   subject.sunny = true
 	 allow(plane).to receive(:landed).and_return(false)
 	 subject.land(plane)
 	 expect(subject.planes).to include(plane)
  end

  it 'checks to see if there are no planes initially at the airport' do
  	expect(subject.planes).to eq []
  end
  
  it 'instructs a plane to land and then take off' do
  	subject.sunny = true
  	allow(plane).to receive(:landed).and_return(false)
  	subject.land(plane)
		allow(plane).to receive(:landed).and_return(true)
		expect(subject.take_off(plane)).to eq plane
  end

	it 'instructs a landed plane to take off and confirm it is gone' do
		subject.sunny = true
		allow(plane).to receive(:landed).and_return(false)
		subject.land(plane)
		allow(plane).to receive(:landed).and_return(true)
		subject.take_off(plane)
		expect(subject.planes).to_not include(plane)
	end
	 
	it 'checks to see that an airplane in the sky has not landed' do
		subject.sunny = true
		allow(plane).to receive(:landed).and_return(false)
		expect(subject.planes).to_not include(plane)
	end

	it 'checks to see that a plane that has taken off is not in the airport' do
		subject.sunny = true
		allow(plane).to receive(:landed).and_return(false)
		subject.land(plane)
		allow(plane).to receive(:landed).and_return(true)
		subject.take_off(plane)
		expect(subject.planes).to_not include(plane)
	end

  it 'checks to see if a plane has landed' do
  	subject.sunny = true
  	allow(plane).to receive(:landed).and_return(false)
  	expect(subject.land(plane)).to eq [plane]
  end

  it 'raises an error if the airport is full' do
  	subject.sunny = true
  	allow(plane).to receive(:landed).and_return(false)
  	Airport::DEFAULT_CAPACITY.times {subject.land(plane)}
  	expect {subject.land(plane)}.to raise_error 'Airport full!'
  end
  
  it 'raises an error if the airport is full when default capacity is specified' do
  	subject.sunny = true
  	allow(plane).to receive(:landed).and_return(false)
  	subject.capacity.times {subject.land(plane)}
  	expect {subject.land(plane)}.to raise_error 'Airport full!'
  end

  it 'has a default capacity' do
  	expect(subject.capacity).to eq Airport::DEFAULT_CAPACITY
  end
  
  it 'overwrites default capacity to 50 when initializing' do
  	airport = Airport.new(50)
  	expect(airport.capacity).to eq 50
  end

 	describe 'initialization' do
 		it 'has a variable capacity' do
 			airport = Airport.new(50)
 			airport.sunny = true
 			allow(plane).to receive(:landed).and_return(false)
 			50.times {airport.land(plane)}
 			expect {airport.land(plane)}.to raise_error 'Airport full!'
 		end
 	end
 	
 	it 'checks to see if you can fill, remove and then fill the airport again' do
 		subject.sunny = true
 		allow(plane).to receive(:landed).and_return(false)
 		Airport::DEFAULT_CAPACITY.times {subject.land(plane)}
 		allow(plane).to receive(:landed).and_return(true)
 		subject.take_off(plane)
 		expect(subject.planes).to include(plane)
 	end

 	it 'prevents plane from taking off if not sunny' do
 		subject.sunny = true
 		allow(plane).to receive(:landed).and_return(false)
 		subject.land(plane)
 		subject.sunny = false
 		expect{subject.take_off(plane)}.to raise_error 'Weather stormy! Cannot take off!'
 	end

 	it 'prevents plane from landing if stormy' do
 		subject.sunny = false
 		expect{subject.land(plane)}.to raise_error 'Weather Stormy cannot land'
 	end

 	it 'raises an error if plane already in sky and tries to takeoff' do
 		subject.sunny = true
 		allow(plane).to receive(:landed).and_return(false)
 		expect{subject.take_off(plane)}.to raise_error 'Plane not at airport!'
 	end

 	it 'raises an error if plane tries to land if already in the airport' do
 		subject.sunny = true
 		allow(plane).to receive(:landed).and_return(false)
 		subject.land(plane)
 		allow(plane).to receive(:landed).and_return(true)
 		expect{subject.land(plane)}.to raise_error 'Plane already landed!'
 	end

 	let(:plane2) {double :plane, :landed= => true, landed?: true}
 	it 'raises an error when plane not at airport and tries to take off' do
  	subject.sunny = true
  	allow(plane).to receive(:landed).and_return(false)
 		subject.land(plane)
  	allow(plane2).to receive(:landed).and_return(false)
  	expect {subject.take_off(plane2)}.to raise_error 'Plane not at airport!'
  end
end
