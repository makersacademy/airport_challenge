require 'weather'

describe Weather do

  # The weather must be random and only have two states "sunny" or "stormy".

  it { is_expected.to respond_to(:report) }

  # it 'is stormy on second report with seed 0' do
  #   allow(Kernel).to receive(:rand).with(anything).and_return(0)
  #   expect(subject.report).to eq :stormy
  # end
  
  it 'is sunny on first report with seed 0' do
    allow(Kernel).to receive(:rand).with(anything).and_return(1)
    expect(subject.report).to eq :sunny
  end

end
