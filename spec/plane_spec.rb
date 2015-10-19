require 'plane'

describe Plane do

  context 'plane is flying' do
    it 'plane is flying' do
      expect(subject.took_off).to eq true
    end
  end

  it 'plane is not flying' do
    expect(subject.landed).to eq false
  end

  it'plane is initialize as a flying' do
    expect(subject).to respond_to(:flying)
  end

end
