require 'airport'

describe Airport do

  it 'instucts plane to land' do
    expect(subject).to respond_to :land
  end

  it 'instructs plane to take off, and confirms its departure' do
    allow(subject).to receive(:storm?) { false }
    subject.land(Plane.new)
    expect(subject.take_off).to eq("Plane has departed")
  end

  it 'prevents landing when airport is full' do
    airport = Airport.new
    allow(airport).to receive(:storm?) { false }
    Airport::DEFAULT_CAPACITY.times { airport.land(Plane.new) }
    expect{airport.land(Plane.new)}.to raise_error("Airport is full")
  end

  it 'changes the capacity' do
    airport = Airport.new(70)
    expect(airport.instance_variable_get(:@capacity)).to eq(70)
  end

  it 'prevents take off in stormy weather' do
    allow(subject).to receive(:storm?) { false }
    subject.land(Plane.new)
    allow(subject).to receive(:storm?) { true }
    expect{subject.take_off}.to raise_error("May not take off due to inclement weather")
  end

  it 'prevents landing in stormy weather' do
    allow(subject).to receive(:storm?) { true }
    expect{subject.land(Plane.new)}.to raise_error("May not land due to inclement weather")
  end
end
