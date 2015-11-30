require 'airport'
require 'plane'

describe Airport do

  let(:airport){Airport.new}
  let(:plane){Plane.new}

  it 'has plane landed' do
    # allow(subject).to receive(:condition){:sunny}
    subject.landing_order(plane)
    expect(subject.planes_landed.count).to eq 1
  end

  it 'has plane taken off' do
    subject.landing_order(plane)
    subject.take_off_order(plane)
    expect(subject.planes_landed.count).to eq 0
  end


end
