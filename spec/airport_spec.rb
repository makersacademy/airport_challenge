require 'airport'

describe Airport do

  it { is_expected.to respond_to(:plane_land).with(1).argument }

  it { is_expected.to respond_to(:plane_takeoff) }

  it 'lands plane' do
    allow(subject).to receive(:stormy?) { false }
    plane = double(:plane)
    subject.plane_land(plane)
    expect(subject.planes).to eq [plane]
  end

  it 'confirms plane has landed' do
    allow(subject).to receive(:stormy?) { false }
    expect(subject.plane_land(double(:plane))).to eq "A plane has landed"
  end

  it 'plane takes off' do
    allow(subject).to receive(:stormy?) { false }
    subject.plane_land(double(:plane))
    subject.plane_takeoff
    expect(subject.planes).to eq []
  end

  it 'confirms plane has taken off' do
    allow(subject).to receive(:stormy?) { false }
    subject.plane_land(double(:plane))
    expect(subject.plane_takeoff).to eq "Plane has taken off"
  end

  it 'raises an error on takeoff, if weather is stormy' do
    allow(subject).to receive(:stormy?) { false }
    subject.plane_land(double(:plane))
    allow(subject).to receive(:stormy?) { true }
    expect { subject.plane_takeoff }.to raise_error
  end

  it 'raises an error when trying to land, if weather is stormy' do
    allow(subject).to receive(:stormy?) { true }
    expect { subject.plane_land(double(:plane)) }.to raise_error
  end


end
