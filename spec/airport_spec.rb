require 'airport'

describe Airport do
  let(:airport) { Airport.new }
  let(:plane) { double :plane }
  let(:stormy) { instance_double("Weather", :stormy? => true) }
  let(:clear) { instance_double("Weather", :stormy? => false) }
  
  it { should respond_to(:land).with(2).arguments }

  it 'should return landed planes when queried' do
    airport.land(plane, clear)
    expect(airport.hangar).to eq([plane])
  end
  it { should respond_to(:take_off).with(2).arguments }
  
  
  context 'with nice weather' do
    it 'should let the requested plane take off' do
      airport.land(plane, clear)
      airport.land(Plane.new, clear)
      expect(airport.take_off(plane, clear)).to eq(plane)
    end
    it 'should no longer store the plane after take off' do
      airport.land(plane, clear)
      airport.take_off(plane, clear)
      expect(airport.hangar).to eq([])
    end
  end
  
  context 'with stormy weather' do
    it 'should not let planes take off' do
      airport.land(plane, clear)
      expect{ airport.take_off(plane, stormy) }.to raise_error('Planes grounded: stormy weather!')
    end
    it 'should not let planes land' do
      expect { airport.land(plane, stormy) }.to raise_error('Airport currently closed due to stormy weather')
    end
  end
end