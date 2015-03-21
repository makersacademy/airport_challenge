require 'control_tower'

describe ControlTower do

  context 'basic operations' do
    before do
      allow(subject).to receive(:stormy?).and_return(false)
    end
    it 'sends landing requests to airport' do
      airport = double :airport, full?: false
      expect(airport).to receive(:park).and_return([:plane])
      expect(subject.land_request :plane, airport).to eq([:plane])
    end

    it 'sends take off requests to airport' do
      airport = double :airport, planes: [:plane]
      expect(airport).to receive(:unpark).and_return([:plane])
      expect(subject.take_off_request :plane, airport).to eq([:plane])
    end
  end

  context 'traffic control' do
    before do
      allow(subject).to receive(:stormy?).and_return(false)
    end
    it 'raises an error if the airport is full' do
      airport = double :airport, full?: true
      expect { subject.land_request :plane, airport }.to raise_error
    end
  end

  context 'weather conditions' do
    before do
      allow(subject).to receive(:stormy?).and_return(true)
    end
    it 'raises an error if is storming during a take off' do
      airport = double :airport, full?: false
      expect { subject.take_off_request :plane, airport }.to raise_error
    end
    it 'raises an error if is storming during a landing' do
      airport = double :airport, full?: false
      expect { subject.land_request :plane, airport }.to raise_error
    end
  end
end
