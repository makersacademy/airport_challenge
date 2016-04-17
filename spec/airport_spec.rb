require 'airport'


describe Airport do


  let(:plane) {double(:plane)}


  it 'should land plane' do
    expect(subject.weather). to receive(:stormy?) {false}
    subject.land(plane)
  end

  it 'should confirm plane has landed' do
    allow(subject.weather).to receive(:stormy?) {false}
    subject.land(plane)
    expect(subject.landed?(plane)).to eq true
  end

  it 'should not allow planes to land if the weather is stormy' do
    allow(subject.weather).to receive(:stormy?) {true}
    expect{subject.land(plane)}.to raise_error 'Cannot land because of bad weather'
  end

  it 'should instruct plane to take off' do
    allow(subject.planes). to receive(:landed?) {true}
    expect(subject.weather).to receive(:stormy?) {false}.twice
    subject.land(plane)
    subject.take_off(plane)
  end

  it 'should check if plane has departed' do
    expect(subject.departed?(plane)).to eq true
  end

  it 'should not allow planes to take off if the weather is stormy' do
    allow(subject.planes). to receive(:landed?) {true}
    allow(subject.weather).to receive(:stormy?) {false}
    subject.land(plane)
    allow(subject.weather).to receive(:stormy?) {true}
   expect{subject.take_off(plane)}.to raise_error 'Cannot take off because of the bad weather'
  end

  it 'should have a default capacity of 20 planes' do
  allow(subject.weather).to receive(:stormy?) {false}
  allow(subject).to receive(:landed?) {false}
    20.times {subject.land(plane)}
    expect{subject.land(plane)}.to raise_error 'Airport at capacity'
  end

  it 'should allow a specified capacity' do
    airport = Airport.new(10)
    allow(airport).to receive(:landed?) {false}
    allow(airport.weather).to receive(:stormy?) {false}
    10.times {airport.land(plane)}
    expect{airport.land(plane)}.to raise_error 'Airport at capacity'
  end

  it 'should not allow plane to take off, if plane is not in airport' do
    allow(subject.planes). to receive(:landed?) {false}
    expect{subject.take_off(plane)}. to raise_error 'Plane is not in airport'
  end

  it 'should not request plane to land if landed' do
    allow(subject.weather).to receive(:stormy?) {false}
    subject.land(plane)
    expect{subject.land(plane)}.to raise_error 'Plane has already landed'
  end



end