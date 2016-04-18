require 'airport'

describe Airport do
  subject(:airport) { described_class.new }
  let(:weather) { double :weather}
  let(:plane) { double :plane}

  before do
    allow(plane).to receive(:landed?)
    allow(plane).to receive(:landed).and_return(false)
    allow(subject).to receive(:weather_check).and_return(false)
    allow(plane).to receive(:airborn?)
  end

  context 'Weather' do

    it 'fails to call plane to land due to weather' do
      allow(subject).to receive(:weather_check).and_return(true)
      message = "Bad weather means plane can\'t land"
      expect {subject.call_land(plane)}.to raise_error message
    end

  end

  context 'Plane Storage' do

    it 'has plane once landed' do
      airport.call_land(plane)
      expect(subject.planes[0]).to be plane
    end

    it 'checks plane removed after takeoff' do
      subject.call_land(plane)
      allow(plane).to receive(:landed).and_return(true)
      subject.takeoff(plane)
      expect(subject.planes).to eq []
    end

    it 'raises error if airport full' do
      Airport::DEFAULTCAPACITY.times {subject.call_land(plane)}
      message = 'The airport is full'
      expect {subject.call_land(plane)}.to raise_error message
    end

    it 'raises error if no planes available to takeoff' do
      expect {subject.takeoff(plane)}.to raise_error 'No planes in airport'
    end

  end

  context 'Plane commands' do

    it 'instructs planes to takeoff' do
      allow(plane).to receive(:landed).and_return(true)
      subject.call_land(plane)
      expect(subject.takeoff(plane)).to eq plane
    end

  end

end
