require 'weather'

describe Weather do

  before :all do
    srand(0)
  end

  it { is_expected.to respond_to(:report) }

  it 'is sunny on first report with seed 0' do
    expect(subject.report).to eq :sunny
  end

  it 'is stormy on second report with seed 0' do
    expect(subject.report).to eq :stormy
  end

end
