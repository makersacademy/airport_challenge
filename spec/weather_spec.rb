require 'weather'

describe Weather do
  it { is_expected.to respond_to :stormy? }

  it 'shows if weather is stormy' do
    expect(subject.stormy?).not_to eq nil
  end
end