require './lib/plane'

describe Plane do
  it 'has a settable landed flag' do
    subject.is_landed = true
    expect(subject.is_landed).to eq true
  end
end