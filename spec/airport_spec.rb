require 'airport'

describe Airport do

  let (:plane) {double :plane}

  it { is_expected.to respond_to(:land).with(1).argument }

  it 'can confirm a plane has landed' do
    subject.land(plane)
    expect(subject.planes_in_airport).to include plane
  end

end
