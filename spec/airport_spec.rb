require 'airport'


describe Airport do
  let(:plane) {double(:plane)}

  it 'should land plane' do
    expect(subject.weather). to receive(:stormy?) {false}
    subject.land(plane)
  end

  it 'should confirm plane has landed' do
    expect(subject.landed?(plane)).to eq true
  end

  it 'should not allow planes to land if the weather is stormy' do
    allow(subject.weather).to receive(:stormy?) {true}
    expect{subject.land(plane)}.to raise_error 'Cannot land because of bad weather'
  end

  it 'should instruct plane to take off' do
    expect(subject.weather).to receive(:stormy?) {false}
    subject.take_off(plane)
  end

  it 'should check if plane has departed' do
    expect(subject.departed?(plane)).to eq true
  end

  it 'should not allow planes to take off if the weather is stormy' do
    allow(subject.weather).to receive(:stormy?) {true}
    expect{subject.take_off(plane)}.to raise_error 'Cannot take off because of the bad weather'
  end

  it 'should have a default capacity of 20 planes' do
  allow(subject.weather).to receive(:stormy?) {false}
  20.times {subject.land(plane)}
    expect{subject.land(plane)}.to raise_error 'Cannot land because airport is at capacity'
  end

  it 'should allow a specified capacity' do
    airport = Airport.new(10)
    allow(airport.weather).to receive(:stormy?) {false}
    10.times {airport.land(plane)}
    expect{airport.land(plane)}.to raise_error 'Cannot land because airport is at capacity'
  end



end