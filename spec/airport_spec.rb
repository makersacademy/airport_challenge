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
  it 'can intruct planes to land' do
    allow(weather).to receive(:stormy?).and_return(false)
    allow(plane).to receive(:flying?).and_return(true)
    allow(plane).to receive(:land)

    subject.instruct_plane_to_land(plane, weather)
    expect(subject.planes).to include(plane)
  end
  it 'can confirm a plane is or isn\'t in the airport' do
    allow(weather).to receive(:stormy?).and_return(false)
    expect(subject.in_airport?(plane)).to_not be(true)

    allow(plane).to receive(:flying?).and_return(true)
    allow(plane).to receive(:land)

    subject.instruct_plane_to_land(plane, weather)
    expect(subject.in_airport?(plane)).to be(true)
  end
  it 'can prevent landing when stormy' do
    allow(weather).to receive(:stormy?).and_return(true)

    allow(plane).to receive(:flying?).and_return(true)
    allow(plane).to receive(:land)

    expect { subject.instruct_plane_to_land(plane, weather) }.to raise_error("Cannot land - severe weather warning!")
    expect(subject.planes).to_not include(plane)
  end
  it 'can prevent landing when full' do
    allow(weather).to receive(:stormy?).and_return(false)
    allow(plane).to receive(:flying?).and_return(true)
    allow(plane).to receive(:land)

    full_airport = Airport.new(0)
    expect { full_airport.instruct_plane_to_land(plane, weather) }.to raise_error("Cannot land - airport is full!")
    expect(full_airport.planes).to_not include(plane)
  end
  it 'can instruct planes to take off' do
    allow(weather).to receive(:stormy?).and_return(false)
    allow(plane).to receive(:flying?).and_return(true)
    allow(plane).to receive(:land)

    subject.instruct_plane_to_land(plane, weather)
    subject.instruct_plane_to_take_off(plane, weather)
    expect(subject.planes).to_not include(plane)
  end
  it 'can prevent planes from taking off when stormy' do
    allow(weather).to receive(:stormy?).and_return(false)
    allow(plane).to receive(:flying?).and_return(true)
    allow(plane).to receive(:land)

    subject.instruct_plane_to_land(plane, weather)
    allow(weather).to receive(:stormy?).and_return(true)
    expect { subject.instruct_plane_to_take_off(plane, weather) }.to raise_error("Cannot take off - severe weather warning!")
    expect(subject.planes).to include(plane)
  end

  context 'edge cases' do
    it 'a plane can\'t land if it\'s not flying' do
      allow(weather).to receive(:stormy?).and_return(false)
      allow(plane).to receive(:flying?).and_return(true)
      allow(plane).to receive(:land)
      subject.instruct_plane_to_land(plane, weather)
      allow(plane).to receive(:flying?).and_return(false)
      expect { subject.instruct_plane_to_land(plane, weather) }.to raise_error("This plane is not in flight!")
    end
    it 'a plane can\'t land if it\'s already at an airport' do
      airport_2 = Airport.new
      allow(weather).to receive(:stormy?).and_return(false)
      allow(plane).to receive(:flying?).and_return(true)
      allow(plane).to receive(:land)
      airport_2.instruct_plane_to_land(plane, weather)
      allow(plane).to receive(:flying?).and_return(false)
      expect(airport_2.planes).to include(plane)
      expect { subject.instruct_plane_to_land(plane, weather) }.to raise_error("This plane is not in flight!")
      expect(subject.planes).to_not include(plane)
    end
    it 'a plane can only take off from an airport it is in' do
      airport_2 = Airport.new
      allow(weather).to receive(:stormy?).and_return(false)
      allow(plane).to receive(:flying?).and_return(true)
      allow(plane).to receive(:land)
      airport_2.instruct_plane_to_land(plane, weather)

      expect { subject.instruct_plane_to_take_off(plane, weather) }.to raise_error("This plane is not in your airport!")
      expect(airport_2.planes).to include(plane)
    end
    # a plane that's flying can't be in an airport # can't really test for this?
    it 'a plane that\'s flying can\'t take off' do
      allow(weather).to receive(:stormy?).and_return(false)
      expect { subject.instruct_plane_to_take_off(plane, weather) }.to raise_error("This plane is not in your airport!")
    end
  end
end
