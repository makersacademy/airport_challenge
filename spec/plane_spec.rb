require 'plane'

describe Plane do

  it 'allows plane to be flying' do
    expect(subject).to respond_to(:flying)
  end

  it 'flying is true when plane flying' do
    expect(subject.flying(true)).to eq true
  end

  it 'flying is false when plane grounded' do
    expect(subject.flying(false)).to eq false

  end


end
