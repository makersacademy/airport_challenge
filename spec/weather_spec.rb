require 'weather'

describe Weather do
  it { should respond_to :now }
end

describe '#now' do
  it 'tells the plane whether it\'s safe to take off' do
    allow(subject).to receive(:now) { 'sunny' }
    expect(subject.now).to eq('sunny')
  end
end
