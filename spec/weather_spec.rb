require 'weather'

describe Weather do
  it { is_expected.to respond_to(:change) }

  it 'changes the weather to stormy' do
    subject.change
    allow(Kernel).to receive(:rand).with(100) {5}
    expect(subject.is_stormy).to eq true
  end


end
