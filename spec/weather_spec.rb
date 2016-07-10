require 'weather'

describe Weather do

  it { is_expected.to respond_to(:stormy?) }

  it '#stormy? return true if rand greater or equal to 5' do
    expect(subject.stormy?).to eq(true)
  end

end
