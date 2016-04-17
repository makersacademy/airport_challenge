require 'airport'


describe Airport do
  let(:plane) {double(:plane)}
  let(:weather) {double(:weather, rand_weather: :stormy)}

  it 'should land plane' do
    expect(subject.land(plane)).to eq true
  end

  it 'should confirm plane has landed' do
    expect(subject.landed?(plane)).to eq true
  end

  it 'should instruct plane to take off' do
    allow(subject.weather).to receive(:stormy?) {false}
    expect(subject.take_off(plane)).to eq true
  end

  it 'should check if plane has departed' do
    expect(subject.departed?(plane)).to eq true
  end

  it 'should not allow planes to take off if the weather is stormy' do
    allow(subject.weather).to receive(:stormy?) {true}
    expect{subject.take_off(plane)}.to raise_error 'Cannot take off because of the bad weather'

  end

end