require 'weather'

describe Weather do
  it { is_expected.to respond_to(:change) }

  it 'changes the weather to stormy with a random function' do
    allow(Kernel).to receive(:rand).with(100) {1}
    subject.change
    expect(subject.is_stormy).to eq true
  end


end
