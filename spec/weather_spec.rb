require 'weather'

describe Weather do

  it { is_expected.to respond_to(:stormy) }
  it 'returns a new storm' do
    expect(subject).equal? Weather.new
  end
end
