require './lib/airport.rb'
require './lib/weather.rb'

describe Airport do

  it 'responds to land' do
  expect(subject).to respond_to  :land
  end

  it 'departs a plane' do
    expect(subject).to respond_to  :depart
  end

  it 'responds to full?' do
    expect(subject).to respond_to  :full?
  end

  it 'raises error when default capacity reached' do
    plane = Plane.new
    airport = Airport.new
    allow(subject.weather).to receive(:stormy?) {true}
    described_class::DEFAULT_CAPACITY.times {subject.land(plane)}
    expect { subject.land(plane) }.to raise_error 'Airport full'
  end


#   it 'prevents takeoff if stormy weather' do
#     allow(subject.weather).to receive(:stormy?) {true}
#     expect{airport.depart}.to raise_error
# end
#
# it 'prevents landing if stormy weather' do
#   plane = Plane.new
#   allow(subject.weather).to receive(:stormy?) {true}
#   expect{airport.land(Plane.new)}.to raise_error


end
