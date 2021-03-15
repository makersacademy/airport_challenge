require 'plane'

describe Plane do
  let(:plane) {Plane.new}
  let(:airport) {double :airport}
    
  it 'sets status of aircraft to airborne when created' do
    expect(plane).to be_flying
  end

  it 'is allowed to take off' do
    expect(airport).to receive(:allow_take_off).with(plane)
    plane.take_off(airport)
  end

  it 'updates status of aircraft to airborne after take off' do 
    allow(airport).to receive(:receive).with(plane).and_return(true)
    plane.land(airport)
    allow(airport).to receive(:allow_take_off).with(plane).and_return(true)
    expect{ plane.take_off(airport) }.to change{ plane.flying? }.from(false).to(true)
  end
end 