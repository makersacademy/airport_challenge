require 'plane'

describe Plane do

  subject(:plane) { described_class.new }

  it {is_expected.to respond_to(:flying)}
  it {is_expected.to respond_to(:landed)}
  it {is_expected.to respond_to(:airborne?)}

  it 'starts on the ground' do
    expect(subject.airborne?).to eq(false)
  end

  it 'is airborne if flying' do
    subject.flying
    expect(subject.airborne?).to eq(true)
  end

  it 'is not airborne if landed' do
    subject.landed
    expect(subject.airborne?).to eq(false)
  end

end
