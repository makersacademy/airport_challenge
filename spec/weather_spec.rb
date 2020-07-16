require 'weather'

RSpec.describe Weather do

  it { is_expected.to respond_to(:stormy?) }

  it 'returns 1 or 2' do
    expect(subject.stormy?).to be(1).or be(2)
  end

end
