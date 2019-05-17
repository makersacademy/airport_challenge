require 'airport'

describe Airport do
  let(:airport) { Airport.new }
  let(:plane) { double :plane }
  let(:weather) { instance_double("Weather") }
  
  it { should respond_to(:land).with(1).argument }

  it 'should return landed planes when queried' do
    airport.land(plane)
    expect(airport.hangar).to eq([plane])
  end
  it { should respond_to(:take_off).with(2).arguments }
  
  
  context 'with nice weather' do
    it 'should let the requested plane take off' do
      allow(weather).to receive(:stormy?).and_return(false)
      airport.land(plane)
      airport.land(Plane.new)
      expect(airport.take_off(plane, weather)).to eq(plane)
    end
    it 'should no longer store the plane after take off' do
      allow(weather).to receive(:stormy?).and_return(false)
      airport.land(plane)
      airport.take_off(plane, weather)
      expect(airport.hangar).to eq([])
    end
  end
  
  context 'with stormy weather' do
    it 'should not let planes take off' do
      allow(weather).to receive(:stormy?).and_return(true)
      airport.land(plane)
      expect{ airport.take_off(plane, weather) }.to raise_error('Planes grounded: stormy weather!')
    end
  end
end