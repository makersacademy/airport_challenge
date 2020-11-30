require 'airport'
require 'weather'

describe Airport do

  let(:plane) {Plane.new}
  it { is_expected.to respond_to(:land).with(1).argument } 

  it 'adds plane to hanger when landed' do
    allow(subject).to receive(:weather) { false }
    subject.land(plane)
    expect(subject.hanger[0]).to eq plane
  end

  it { is_expected.to respond_to(:take_off) }

  it 'removes plane from airport on take off' do
    allow(subject).to receive(:weather) { false }
    subject.land(plane)
    subject.take_off(plane)
    expect(subject.hanger).not_to include plane
  end

  it 'Airport takes 1 argument' do 
    expect(Airport).to respond_to(:new).with(1).argument
  end

  it 'Airport initializes default capacity of 20' do
    expect(subject.capacity).to eq 20
  end
  
  it 'full? raises error' do
    allow(subject).to receive(:weather) { false }
    20.times { subject.land("plane") }
    expect { subject.land("plane") }.to raise_error 'Airport Full!'
  end

  it 'returns stormy if weather >= 8' do
    allow(subject).to receive(:weather) { true }
    expect(subject.weather).to eq true
  end

  it 'raises error if weather is stormy on take_off' do
    expect { subject.take_off(plane) }.to raise_error('Too stormy') if (subject.weather == true)
  end

  it 'raises error if weather is stormy on land' do
    expect { subject.land(plane) }.to raise_error('Too stormy') if (subject.weather == true)
  end
end
