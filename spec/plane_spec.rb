require 'plane'

describe Plane do
  it { is_expected.to respond_to :landed? }

  it 'has flying status when initialized' do
    expect(subject).to be_flying
  end

  it 'does not have flying status when landed' do
    subject.landed?
    expect(subject).not_to be_flying
  end

  it 'has flying status after take off' do
    subject.taken_off?
    expect(subject).to be_flying
  end
  
end
