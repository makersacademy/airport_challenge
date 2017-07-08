require 'plane'
describe Plane do
  let(:airport) { double("airport",
                  :land => nil,
                  :takeoff => nil)
  }

  it { is_expected.to respond_to :in_flight? }
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

  it 'should report when it is in flight' do
    expect(subject.in_flight?).to be true
  end

  it 'should report when it is not in flight' do
    subject.land_at(airport)
    expect(subject.in_flight?).to be false
  end

end
