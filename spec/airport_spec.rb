require 'airport'

describe Airport do

let(:plane) {double :plane}

  it{is_expected.to respond_to(:land).with(1).argument}

  it 'can land a plane' do
    allow(plane).to receive(:location=).with(subject)
    expect(subject.land(plane)).to eq (plane)
  end

  it 'landing a plane sets its location to current airport' do
    expect(plane).to receive(:location=).with(subject)
    subject.land(plane)
  end

  it 'landed planes should be stored in the airport' do
    allow(plane).to receive(:location=).with(subject)
    subject.land(plane)
    expect(subject.planes).to include(plane)
  end

  it{is_expected.to respond_to(:take_off).with(1).argument}

  it 'taking off should set the plane\'s location to in the air' do
    expect(plane).to receive(:location=).with("in_the_air")
    subject.take_off(plane)
  end

  it 'planes which have taken off should no longer be in the airport' do
    allow(plane).to receive(:location=).with("in_the_air")
    subject.planes << plane
    expect(subject.planes).to include(plane)
    subject.take_off(plane)
    expect(subject.planes).not_to include(plane)
  end


end
