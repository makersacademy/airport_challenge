require "weather"

describe Weather do

  it { is_expected.to respond_to :stormy? }

  before :each do
    srand(7)
  end

  it 'returns false when the random number is <= 7' do
  expect(subject.stormy?).to eq(false)
  end

end
