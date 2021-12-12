require 'weather'

describe Weather do
  it { is_expected.to respond_to :stormy? }

  it 'is either stormy or not' do
    expect(subject.stormy?).to be(true).or be(false)
  end
end