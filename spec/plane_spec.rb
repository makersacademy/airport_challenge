require 'plane'

describe Plane do
  it 'is not landed by default' do
    expect(subject.landed).to eq false
  end
end
