require 'weather'

describe Weather do
  it 'is #stormy' do
    expect(subject.stormy?).to eq true
  end
end