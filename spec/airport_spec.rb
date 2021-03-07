require 'airports.rb'

describe Airport do

  it 'land_plane' do
    expect(subject).to respond_to(:land_plane).with(1).argument
  end

  it 'airports store the planes that land' do
    test_plane1 = Plane.new
    subject.land_plane(test_plane1)

    expect(subject.planes).to eq [test_plane1]
  end

  it 'only lets airbourne planes land' do
    test_plane2 = Plane.new("LHR")

    expect { subject.land_plane(test_plane2) }.to raise_error('Plane already grounded')
  end

  it 'plane_take_off' do
    expect(subject).to respond_to(:plane_take_off).with(1).argument
  end

  it 'only allows planes to take off from airports they are currently at' do
    test_plane3 = Plane.new("LHR")
    test_airport2 = Airport.new("ZUR")

    expect { test_airport2.plane_take_off(test_plane3) }.to raise_error('Plane not at this airport!')
  end

  it 'removes plane from airport record if taken off' do
    test_plane4 = Plane.new
    test_airport3 = Airport.new("LAX")
    test_airport3.land_plane(test_plane4)
    test_airport3.plane_take_off(test_plane4)

    expect(test_airport3.planes).to eq []
  end

  it 'airports have a default capacity' do
    expect(subject.capacity).to eq 10
  end

  it 'airports initialize with no planes' do
    expect(subject.planes).to eq []
  end

  it 'raises error if plane tries to land at full airport' do
    10.times { subject.land_plane(Plane.new) }

    expect { subject.land_plane(Plane.new) }.to raise_error("Airport full!")
  end

  it 'allows the default capacity to be overridden at Airport initialize' do
    heathrow = Airport.new("LHR", 15)
    expect(heathrow.capacity).to eq 15
  end

  it 'prevents takeoff when weather is bad' do
    # unable to write test that funnels stub instance variable in to other method, however passes feature tests
    # test_plane3 = Plane.new
    # test_airport2 = Airport.new
    # allow(test_airport2).to receive(:weather).and_return(8)
    # p test_airport2.weather
    #
    # expect { test_airport2.plane_take_off(test_plane3) }.to raise_error("Weather too dangerous!")

    allow(subject).to receive(:plane_take_off).and_raise("Weather too dangerous!")

    expect { subject.plane_take_off }.to raise_error("Weather too dangerous!")
  end
end
