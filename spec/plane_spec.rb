require 'plane'

describe Plane do

  it 'allows plane to be flying' do
    expect(subject).to respond_to(:flying)
  end

  it 'allows plane to be grounded' do
    expect(subject).to respond_to(:grounded)
  end

  it 'flying is true when plane flying' do
    expect(subject.flying).to eq true
  end

  it 'flying is false when plane grounded' do
    expect(subject.grounded).to eq false

  end


end
