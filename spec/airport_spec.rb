require './lib/airport.rb'

describe Airport do
  let(:plane) { double :plane }

  it 'responds to land' do
    expect(subject).to respond_to(:land).with(1).argument
  end

  it 'departs a plane' do
    expect(subject).to respond_to  :depart
  end

  it 'responds to full?' do
    expect(subject).to respond_to  :full?
  end

  it 'prevents taking off when stomry' do
    allow(subject).to receive(:stormy?) { true }
    expect { subject.depart(Plane.new) }.to raise "Can not take off in stomry weather"
  end

  it 'raises error when default capacity reached' do
    allow(subject).to receive(:stormy?) { false }
    Airport::DEFAULT_CAPACITY.times { subject.land(Plane.new) }
    expect { subject.land(Plane.new) }.to raise 'Airport full'
  end
end
#
#
#   it 'prevents takeoff if stormy weather' do
#     allow(subject.weather).to receive(:stormy?) {true}
#     expect{airport.depart}.to raise_error
# end
#
# it 'prevents landing if stormy weather' do
#   plane = Plane.new
#   allow(subject.weather).to receive(:stormy?) {true}
#   expect{airport.land(plane)}.to raise_error
# end
