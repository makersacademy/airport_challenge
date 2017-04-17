require 'plane'

describe Plane do
  subject { described_class.new }

  it 'has a flying status when created' do
    expect(subject).to be_flying
  end

  it 'does not have a flying status when landed' do
    subject.land?
    expect(subject).not_to be_flying
  end

  # it 'is able to take off' do
  #   subject.take_off?
  #   expect(subject).to be_flying
  # end

  # it 'is able to land' do
  #   subject.take_off?
  #   subject.land?
  #   expect(subject).not_to be_flying
  # end
end