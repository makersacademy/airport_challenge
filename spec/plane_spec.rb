require 'plane'
require 'airport'

describe Plane do
  let(:airport) { Airport.new }

  it { is_expected.to respond_to :landed? }
  it { is_expected.to respond_to :flying? }

  it 'has a flying status when created' do
    allow(subject).to receive(:stormy?) { false }
    expect(subject.flying?).to equal true
  end

  it 'can land' do
    allow(subject).to receive(:stormy?) { false }
    airport.land(subject)
    expect(subject).not_to be_flying
  end

  it 'can take off' do
    allow(subject).to receive(:stormy?) { false }
    airport.land(subject)
    airport.take_off(subject)
    expect(subject).to be_flying
  end
end



