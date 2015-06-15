require 'plane'

describe Plane do

  it 'is flying when created' do
    expect(subject).to be_flying
  end

  it ' is not landed when created' do
    expect(subject).not_to be_landed

  end

  it {expect(subject).to respond_to :landing}

  it 'is not flying after landing' do
    subject.landing
    expect(subject).not_to be_flying
  end

  it 'is is landed after landing' do
    subject.landing
    expect(subject).to be_landed
  end

  it {expect(subject).to respond_to :take_off}

  it 'is not landed after taking off' do
    subject.take_off
    expect(subject).not_to be_landed
  end

  it 'is flying after take off' do
    subject.take_off
    expect(subject).to be_flying
  end

end
