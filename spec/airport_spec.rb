require 'airport'

describe Airport do
  let(:plane) { double(:plane) }
  let(:weather) { double(:weather) }

  it 'has a default capacity' do
    expect(subject.capacity).to eq(Airport::DEFAULT_CAPACITY)
  end
  it 'has a variable capacity' do
    airport = Airport.new(20)
    expect(airport.capacity).to eq(20)
  end
  it 'can store planes' do
    allow(weather).to receive(:is_stormy?).and_return(false)
    subject.accept_plane(plane, weather)
    expect(subject.planes).to include(plane)
  end
  xit 'cannot store more planes than capacity' do
  end
  it 'can confirm a plane is or isn\'t in the airport' do
    allow(weather).to receive(:is_stormy?).and_return(false)
    expect(subject.in_airport?(plane)).to_not be(true)
    subject.accept_plane(plane, weather)
    expect(subject.in_airport?(plane)).to be(true)
  end
  it 'can prevent landing' do
    allow(weather).to receive(:is_stormy?).and_return(true)
    expect { subject.accept_plane(plane, weather) }.to raise_error("Cannot land - severe weather warning!")
    expect(subject.planes).to_not include(plane)
  end
end
