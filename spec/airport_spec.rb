require 'airport.rb'

describe Airport do

  let(:plane) {double :plane}
  let(:weather) {double :weather}

  it 'raise an error if is full' do
    allow(weather).to receive(:stormy?).and_return(false)
    subject.weather?(weather.stormy?)
    subject.landing(plane)
    expect {subject.landing(plane)}.to raise_error 'airport is full'
  end

  it 'raise error if stormy' do
    allow(weather).to receive(:stormy?).and_return(true)
    subject.weather?(weather.stormy?)
    expect{subject.landing(plane)}.to raise_error 'too stormy to land'
  end

  it 'raise error if stormy' do
    allow(weather).to receive(:stormy?).and_return(true)
    subject.weather?(weather.stormy?)
    expect{subject.landing(plane)}.to raise_error 'too stormy to land'
  end

end
