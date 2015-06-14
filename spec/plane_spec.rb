require 'plane'

describe Plane do
  it { is_expected.to respond_to :flying? }

  it { is_expected.to respond_to :landed? }

  it { is_expected.to respond_to :landing }

  it { is_expected.to respond_to :take_off }

  it 'is initially flying' do
    expect(subject).to be_flying
  end

  it 'is not flying if it lands' do
    subject.landing
    expect(subject).not_to be_flying
  end

  it 'is not landed if its flying' do
    subject.take_off
    expect(subject).not_to be_landed
  end

  it 'is landed after landing' do
    subject.landing
    expect(subject).to be_landed
  end

  it 'is flying after take_off' do
    subject.take_off
    expect(subject).to be_flying
  end

  it 'is not initially landed' do
    expect(subject).not_to be_landed
  end

end
