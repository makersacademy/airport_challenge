require_relative('../lib/plane')

describe Plane do

  it 'can land at airports' do
    expect(subject).to respond_to(:land).with(1).argument
  end

  it 'can take off from airports' do
    expect(subject).to respond_to(:take_off).with(1).argument
  end

  it 'has a default capacity' do
    expect(subject.capacity).to eq Plane::DEFAULT_CAPACITY
  end

  it 'has a default capacity that can be overridden on initialization' do
    test_capacity = 100
    plane = Plane.new(test_capacity)
    expect(plane.capacity).to eq test_capacity
  end

  it 'will not land at airports if it is already landed, even if the airport attempts to gives it clearance' do
    airport = double(:airport, iata_code: :test_iata_code, planes_currently_landed: [])
    subject.land(airport)
    expect { subject.land(double(:airport)) }.to raise_error(PlaneStatusError)
  end

  it 'will not take off from airports if it is already flying, even if the airport attempts to gives it clearance' do
    airport = double(:airport, iata_code: :test_iata_code, planes_currently_landed: [])
    subject.land(airport)
    subject.take_off(airport)
    expect { subject.take_off(double(:airport)) }.to raise_error(PlaneStatusError)
  end
end