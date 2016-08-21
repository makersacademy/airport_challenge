require 'airport'

describe Airport do

  describe 'land(plane)' do
    it 'confirms a plane has landed' do
      allow(subject).to receive(:stormy?) { false }
      plane = double(:plane, landed?: false)
      allow(plane).to receive(:report_landed)
      expect(subject.land(plane)).to eq "#{plane} has landed at #{subject}"
    end

    it 'cannot land a plane when at capacity' do
      allow(subject).to receive(:stormy?) { false }
      plane = double(:plane, landed?: false)
      allow(plane).to receive(:report_landed)
      subject.capacity.times {subject.land(plane)}
      expect {subject.land(plane)}.to raise_error "#{subject} is currently at full capacity"
    end

    it 'cannot land a plane currently at an airport' do
      allow(subject).to receive(:stormy?) { false }
      plane = double(:plane, landed?: false)
      allow(plane).to receive(:report_landed)
      subject.land(plane)
      plane = double(:plane, landed?: true)
      expect {subject.land(plane)}.to raise_error "#{plane} is currently at an airport"
    end
  end

  it 'stores a plane at airport' do
    allow(subject).to receive(:stormy?) { false }
    plane = double(:plane, landed?: false)
    allow(plane).to receive(:report_landed)
    subject.land(plane)
    expect(subject.landed_planes).to include plane
  end

  describe 'take_off(plane)' do
    it 'takes off a plane and confirms it has left' do
      allow(subject).to receive(:stormy?) { false }
      plane = double(:plane, landed?: false)
      allow(plane).to receive(:report_landed)
      subject.land(plane)
      allow(plane).to receive(:landed?).and_return(true)
      allow(plane).to receive(:report_taken_off)
      expect(subject.take_off(plane)).to eq "#{plane} has taken off from #{subject}"
    end

    it 'cannot take off a plane that is already in the air' do
      plane = double(:plane, landed?: false)
      allow(subject).to receive(:stormy?) { false }
      expect {subject.take_off(plane)}.to raise_error "#{plane} is already in the air"
    end

    it 'cannot take off a plane not currently at the airport' do
      allow(subject).to receive(:stormy?) { false }
      plane = double(:plane, landed?: true)
      expect {subject.take_off(plane)}.to raise_error "#{plane} is not currently landed at this airport"
    end
  end

  it 'removes plane from airport once it has taken off' do
    allow(subject).to receive(:stormy?) { false }
    plane = double(:plane, landed?: false)
    allow(plane).to receive(:report_landed)
    subject.land(plane)
    allow(plane).to receive(:landed?).and_return(true)
    allow(plane).to receive(:report_taken_off)
    subject.take_off(plane)
    expect(subject.landed_planes).to be_empty
  end

  it 'cannot take off when weather is stormy' do
    allow(subject).to receive(:stormy?) { false }
    plane = double(:plane, landed?: false)
    allow(plane).to receive(:report_landed)
    subject.land(plane)
    allow(plane).to receive(:landed?).and_return(true)
    allow(subject).to receive(:stormy?) { true }
    expect {subject.take_off(plane)}.to raise_error 'Plane cannot take off due to stormy conditions'
  end

  it 'cannot land a plane when weather is stormy' do
    allow(subject).to receive(:stormy?) { true }
    plane = double(:plane, landed?: false)
    allow(plane).to receive(:report_landed)
    expect {subject.land(plane)}.to raise_error "Plane cannot land due to stormy conditions"
  end

  describe 'capacity' do
    it 'has a default capacity' do
      expect(subject.capacity).to eq described_class::DEFAULT_CAPACITY
    end

    it 'can take an argument at instatiation as the capacity' do
      subject = Airport.new 30
      expect(subject.capacity).to eq 30
    end
  end

  describe 'change_capacity' do
    it 'changes the capacity after instantiation' do
    subject.change_capacity(30)
    expect(subject.capacity).to eq 30
    end
  end

end
