require 'weather'

describe Weather do
  it { is_expected.to respond_to(:stormy) }

  it '#stormy returns true if @number >= 90' do
    subject.instance_eval { @number = 92 }
    expect(subject.stormy).to eq(true)
  end

  it '#stormy returns false if @number < 90' do
    subject.instance_eval { @number = 32 }
    expect(subject.stormy).to eq(false)
  end
end
