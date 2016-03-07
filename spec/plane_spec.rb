require 'plane'

describe Plane do

  subject(:plane) { described_class.new }

  it 'changes status of plane to landed' do
    subject.landed?
    expect(subject.landed).to eq true
  end

  it 'changes status of plane to airborn' do
    subject.airborn?
    expect(subject.landed).to eq false
  end

end
