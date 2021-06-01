require 'plane'
require 'airport'
describe 'plane' do
  let(:plane) { Plane.new }
  let(:airport) { Airport.new }
  it 'planes cannot take off when flying' do
    allow(airport).to receive(:stormy?).and_return(false)
    plane.take_off
    expect(plane.flying).to eq(true)
    expect { plane.take_off }.to raise_error('Plane already flying')
  end
  it 'planes cannot land when landed' do
    allow(airport).to receive(:stormy?).and_return(false)
    plane.take_off
    plane.land
    expect(plane.flying).to eq(false)
    expect { plane.land }.to raise_error('Plane already landed')
  end
end
