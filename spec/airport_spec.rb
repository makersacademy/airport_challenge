require 'airport'
require 'plane'

describe Airport do
  describe '#initialize' do
    it 'keeps the default capacity' do
      expect(subject.capacity).to eq Airport::DEFAULT_CAPACITY
    end
    it 'takes a non-default capacity' do
      non_standard_airport = Airport.new(30)
      expect(non_standard_airport.capacity).to eq 30
    end
  end
  it 'the airport class exists' do
    expect(subject).to eq subject
  end
  it ' when a plane lands the stored planes increases by 1' do
    plane = Plane.new
    allow(subject).to receive(:weather).and_return("sunny")
    subject.land(plane)
    initial_storage = []
    expect(subject.storage.length).to eq initial_storage.length + 1
  end
  it 'allows a plane to land' do
    plane = Plane.new
    allow(subject).to receive(:weather).and_return("sunny")
    expect(subject.land(plane)).to eq "#{plane} landed at #{subject}"
  end
  it 'allows a plane to takeoff if it is at the airport' do
    plane = Plane.new
    allow(subject).to receive(:weather).and_return "sunny"
    subject.land(plane)
    allow(subject).to receive(:weather).and_return "sunny"
    expect(subject.takeoff(plane)).to eq "#{plane} tookoff from #{subject}"
  end
  it 'plane will not takeoff if it is not at an airport' do
    plane = Plane.new
    allow(subject).to receive(:weather).and_return "sunny"
    expect { subject.takeoff(plane) }.to raise_error("#{plane} can't take off, it isn't at #{subject}")
  end
  it 'assigns a weather condition' do
    allow(subject).to receive(:weather).and_return "sunny"
    expect(subject.weather).to eq "sunny"
  end
  it 'plane will not takeoff if it is stormy' do
    plane = Plane.new
    allow(subject).to receive(:weather).and_return "stormy"
    expect { subject.takeoff(plane) }.to raise_error("#{plane} can't take off, it is stormy")
  end
  it 'plane will not land if it is stormy' do
    plane = Plane.new
    allow(subject).to receive(:weather).and_return "stormy"
    expect { subject.land(plane) }.to raise_error("#{plane} can't land, it is stormy")
  end
  it 'confirm a plane is at an airport' do
    plane = Plane.new
    allow(subject).to receive(:weather).and_return "sunny"
    subject.land(plane)
    expect(subject.at_airport?(plane)).to eq "#{plane} is at #{subject}"
  end
  it 'confirm a plane is not at an airport' do
    plane = Plane.new
    allow(subject).to receive(:weather).and_return "sunny"
    subject.land(plane)
    allow(subject).to receive(:weather).and_return "sunny"
    subject.takeoff(plane)
    expect(subject.at_airport?(plane)).to eq "#{plane} isn't at #{subject}"
  end
  it 'if the airport is full then a plane can not land' do
    plane = Plane.new
    allow(subject).to receive(:weather).and_return "sunny"
    Airport::DEFAULT_CAPACITY.times{subject.land(plane)}
    expect { subject.land(plane) }.to raise_error("#{plane} can't land at #{subject} as the airport is full!")
  end
end
