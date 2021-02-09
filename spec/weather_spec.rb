require 'weather'

describe Weather do

  # Check methods exist
  it { is_expected.to respond_to(:stormy?) }

  # Check probability
  it 'should always return true if probability set to 1' do
    1000.times { expect(Weather.new(1).stormy?).to eq true }
  end

  it 'should always return false if probability set to 0' do
    1000.times { expect(Weather.new(0).stormy?).to eq false }
  end

end
