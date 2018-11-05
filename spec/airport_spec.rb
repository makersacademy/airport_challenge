require 'airport'

describe Airport do

  let(:aeroplane1) { double(:aeroplane) }
  let(:aeroplane2) { double(:aeroplane) }

  before :each do
    allow(aeroplane1).to receive(:land)
    allow(aeroplane2).to receive(:land)
    allow(aeroplane1).to receive(:take_off)
    allow(aeroplane2).to receive(:take_off)
  end
  it 'allows an aeroplane to land' do
    subject.allow_landing(aeroplane1)
    expect(subject.aeroplanes).to include(aeroplane1)
  end

  it 'allows a plane to take off' do
    subject.allow_landing(aeroplane1)
    expect(subject.allow_take_off(aeroplane1)).to eq(aeroplane1)
    expect(subject.aeroplanes).not_to include(aeroplane1)
  end

  it 'can say if plane is present or not' do
    subject.allow_landing(aeroplane2)
    expect(subject.plane_present?(aeroplane2)).to eq(true)
    expect(subject.plane_present?(aeroplane1)).to eq(false)
  end

  it 'has an id' do
    airport1 = Airport.new
    airport2 = Airport.new
    expect(airport1.id).to eq(4)
    expect(airport2.id).to eq(5)
  end

  it 'has a default capacity of 20 aeroplanes' do
    expect(subject.capacity).to eq(20)
  end

  it 'has a default capacity that can be overridden' do
    random_capacity =(rand(40) + 1)
    expect(Airport.new(random_capacity).capacity).to eq(random_capacity)
  end

  it 'can be full' do
    random_capacity =(rand(40) + 1)
    airport = Airport.new(random_capacity)
    random_capacity.times { airport.allow_landing(Aeroplane.new) }
    expect(airport.full?).to eq(true)
  end
end
