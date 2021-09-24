require 'plane'

describe Plane do
  it { is_expected.to respond_to :in_airport }

  it { is_expected.to respond_to :landed? }

  it 'can be reported as landed' do
    subject.in_airport
    expect(subject).to be_landed
  end
end
