require 'plane'

describe Plane do

  context 'plane is flying' do
    it 'plane is flying' do
      plane = Plane.new
      expect(subject.flying).to eq true
    end
  end

  it 'plane is not flying' do
    expect(subject.landed).to eq false
  end
end
