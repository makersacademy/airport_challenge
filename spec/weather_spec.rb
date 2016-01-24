require 'weather'

describe Weather do
  it 'shows if weather is stormy' do
    expect(subject.stormy?).not_to eq nil
  end
end