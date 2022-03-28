require 'airport'

describe Airport do

  let(:plane) { double :plane }
  let(:weather) { double :weather }
  it 'holds custom capacities' do
    airport = Airport.new(50)
    allow(subject).to receive(:stormy?).and_return false
    expect { 50.times { airport.land(double(:plane, :flying =>true)) } }.not_to raise_error
  end

  context 'when it is sunny' do
   
    it 'holds the plane after landing' do
      plane = double(:plane, :flying => true)
      weather = double(:weather, :stormy => false)
      subject.land(plane, weather)
      expect(subject.hanger).to include plane
    end

    it 'landing raises an error when hanger is full' do
      subject.capacity.times { subject.land(double(:plane, :flying =>true)) }
      expect { subject.land double(:plane) }.to raise_error 'Hanger is full'
    end

    it 'lets planes take off' do
      plane = double(:plane, :flying => false)
      weather = double(:weather, :stormy => false)
      subject.land(plane, weather)
      expect(subject.take_off(plane)).to eq(plane)
    end

    it 'cant take_off a flying plane' do
      plane = double(:plane, :flying => true)
      expect { subject.take_off(plane)}.to raise_error "Plane is already flying!"
    end
  end

  context 'when it is stormy' do
    it 'raises an error on take_off' do
      plane = double(:plane, :flying => true)
      weather = double(:weather, :stormy => false)
      subject.land(plane, weather)
      weather = double(:weather, :stormy => true)
      expect { subject.take_off(plane, weather) }.to raise_error 'Weather is stormy'
    end

    it 'raises an error on landing' do
      plane = double(:plane, :flying => true)
      weather = double(:weather, :stormy => true)
      expect { subject.land(plane, weather) }.to raise_error 'Weather is stormy'
    end
  end
end
