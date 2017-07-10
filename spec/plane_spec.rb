require 'plane'
describe Plane do
  let(:airport) { double("airport",
                  :land => nil,
                  :takeoff => nil)
  }

  it { is_expected.to respond_to :land_at }
  it { is_expected.to respond_to :landed_at? }
  it { is_expected.to respond_to :takeoff_from }

  it 'is expected to land at an airport and confirm that it has landed' do
    expect(subject.landed_at?(airport)).to be false
    subject.land_at(airport)
    expect(subject.landed_at?(airport)).to be true
  end

  it 'is expected to take off from an airport and confirm that it is no longer in that airport' do
    subject.land_at(airport)
    subject.takeoff_from(airport)
    expect(subject.landed_at?(airport)).to be false
  end

  it 'is expected not to initiate new landings if already landed' do
    subject.land_at(airport)
    expect { subject.land_at(airport) }.to raise_error "Error. Can\'t land what\'s already landed."
  end

  it 'is expected not to initiate take-off from the airport prior to being landed there' do
    expect { subject.takeoff_from(airport) }.to raise_error "Error. Can\'t take-off from #{airport} as we are not there."
  end
end
