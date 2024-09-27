require 'airport'
require 'plane'

describe Plane do

  let(:plane) { described_class.new }
  let(:airport) { Airport.new }

  it { is_expected.to be_flying }

  it 'does not have flying status when landed' do
    subject.land?
    expect(subject).not_to be_flying
  end

  it 'can take off' do
    expect{subject.take_off}.not_to raise_error
  end

  # it 'has flying status once taken off' do
  #   subject.take_off
  #   expect(subject.take_off).to be_flying
  # end

end
