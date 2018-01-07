require 'airport'

describe Airport do

  let(:plane) { double("plane") }

  it 'Can create a new instance' do
    expect(subject).to be_a Airport
  end

  it 'Responds to land method with plane as an argument' do
    expect(subject).to respond_to(:land).with(1).argument
  end

  it 'Allows a plane to be stored in the hangar' do
    allow(subject).to receive(:stormy?) { false }
    expect(subject.land(plane)).to eq [plane]
  end

  it 'Doesn\'t allow the same plane to be put in the hangar' do
    allow(subject).to receive(:stormy?) { false }
    subject.land(plane)
    expect { subject.land(plane) }.to raise_error("#{plane} is already in the hangar")
  end

  it 'Allows a plane to take off and confirms it has left the hangar' do
    allow(subject).to receive(:stormy?) { false }
    subject.land(plane)
    expect(subject.takeoff(plane)).to eq "#{plane} has left the hangar!"
  end

  it 'Can check the status of a plane' do
    allow(subject).to receive(:stormy?) { false }
    subject.land(plane)
    expect(subject.status(plane)).to eq "#{plane} is in the hangar"
  end

  it 'Doesn\'t allow a plane to take off if it\'s not in the hangar' do
    allow(subject).to receive(:stormy?) { false }
    expect { subject.takeoff(plane) }.to raise_error("#{plane} is not in the hangar")
  end

  it 'Doesn\'t allow a plane to land if it is stormy' do
    allow(subject).to receive(:stormy?) { true }
    expect { subject.land(plane) }.to raise_error("The plane can't land as there's a storm")
  end

  it 'Doesn\'t allow a plane to take off if it is stormy' do
    allow(subject).to receive(:stormy?) { true }
    expect { subject.takeoff(plane) }.to raise_error("The plane can't take off as there's a storm")
  end

  it 'Doesn\'t allow landing when the hangar is full' do
    allow(subject).to receive(:stormy?) { false }
    expect { 21.times { subject.land(Plane.new) } }.to raise_error("The plane can't land as the hangar is full")
  end

  it 'Sets a default capacity' do
    expect(subject.capacity).to eq 20
  end

  it 'Allows a custom capacity to be set' do
    expect(Airport.new(30).capacity).to eq 30
  end

end
