require 'airport'

describe Airport do

  let(:plane) { double('a plane', flying?: true) }

  describe '#initialize' do
    it "should allow a user to set the capacity" do
      airport = Airport.new(50)
      expect(airport.capacity).to eq 50
      airport.capacity = 100
      expect(airport.capacity).to eq 100
    end

    it "should have a default capacity" do
      expect(subject.capacity).to eq Airport::DEFAULT_CAPACITY
    end
  end

  it 'allows planes to land and take off except in stormy weather' do
    allow(plane).to receive(:land).and_return(flying?: false)
    allow(plane).to receive(:fly).and_return(flying?: true)
    allow(subject).to receive(:stormy?) { true }
    # Check planes cannot land during stormy weather
    expect { subject.land(plane) }.to raise_error "It is too stormy to land"
    allow(subject).to receive(:stormy?) { false }
    subject.land(plane)
    # Check planes can land in good weather
    expect(subject.planes).to eq [plane]
    allow(subject).to receive(:stormy?) { true }
    # Check planes cannot take off in stormy weather
    expect { subject.take_off(plane) }.to raise_error "It is too stormy to take off"
    allow(subject).to receive(:stormy?) { false }
    subject.take_off(plane)
    #  Check planes can take off in good weather
    expect(subject.planes).to eq []
  end

  it 'will not allow planes to land if it is full' do
    allow(subject).to receive(:stormy?) { false }
    40.times { subject.land(Plane.new) }
    expect { subject.land(plane) }.to raise_error "Please enter holding pattern, we are at full capacity"
  end

  it 'will not allow planes which are not at the airport to take off' do
    expect { subject.take_off(plane) }.to raise_error "That plane is not at this airport"
  end

  it 'checks the weather and doesn\'t land all planes do to stormy weather' do
    airport = Airport.new(100)
    expect { 100.times { airport.land(Plane.new) } }.to raise_error "It is too stormy to land"
  end

end
