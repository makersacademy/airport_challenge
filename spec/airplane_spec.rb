require 'airplane'

describe Airplane do
  it 'tests that the grounded variable is false once it takes off' do
    expect(subject.takes_off).to eq false
  end

  it 'tests that the grounded variable is true once a plane lands' do
    expect(subject.lands).to eq true
  end
end
