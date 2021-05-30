require 'plane'
require 'airport'
describe 'plane' do
    let(:plane) { Plane.new }
    let(:airport) { Airport.new }
  it 'planes cannot take off when flying' do
  allow(airport).to receive(:stormy?).and_return(false)
  plane.take_off
  expect(plane.flying).to eq(true)
  expect {plane.take_off}.to raise_error('Plane already flying')
  end
  it 'planes cannot land when landed' do
    allow(airport).to receive(:stormy?).and_return(false)
    expect(plane.flying).to eq(false)
    expect {plane.land}.to raise_error('Plane already landed')
  end
end
  
#       expect(plane).to receive(:flying).and_return(true)
#   end
#
#   it 'does not let flying planes be at an airport' do
#     airport = Airport.new
#     plane = Plane.new
#     allow(airport).to receive(:stormy?).and_return(false)
#     airport.land(plane)
#     airport.take_off(plane)
#     expect(airport.plane_no).not_to contain_exactly(plane)
#   end
#   #user story 8
#   it 'does not allow stationary planes to land' do
#     airport = Airport.new
# #     plane = Plane.new
#     allow(airport).to receive(:stormy?).and_return(false)
#     airport.land(plane)
#     expect {plane.land(airport)}.to raise_error('Plane already landed')
#   end
#   it 'ensures stationary planes are always at an airport' do
#       airport = Airport.new
#       plane = Plane.new
#       allow(airport).to receive(:stormy?).and_return(false)
#       airport.land(plane)
#       expect(airport.plane_no).to contain_exactly(plane)
#   end
#   #user story 9
#   it 'planes that have taken off must not be at airport' do
#     airport = Airport.new
#     plane = Plane.new
#     allow(airport).to receive(:stormy?).and_return(false)
#     airport.land(plane)
#     airport.take_off(plane)
#     expect(airport.plane_no).not_to contain_exactly(plane)
#   end
# end
