require 'plane'

# Think about your implementation - does it allow a plane to be "flying" and landed?
# Are you testing that? Hmmmm, good question

describe Plane do

  it { is_expected.to respond_to :airborne? }

  it { is_expected.to respond_to :grounded? }

  it { is_expected.to respond_to :land }

  it { is_expected.to respond_to :take_off }

  it 'is airborne when created' do
    expect(subject).to be_airborne
  end

  it 'is grounded after landing' do
    subject.land
    expect(subject).to be_grounded
  end

  it 'is not airborne after landing' do
    subject.land
    expect(subject).not_to be_airborne
  end

  it 'is airborne after take off' do
    subject.take_off
    expect(subject).to be_airborne
  end

  it 'is not grounded after take off' do
    subject.take_off
    expect(subject).not_to be_grounded
  end

end
