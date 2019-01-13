require 'weather'

describe Weather do
  it { should respond_to :now }
end

describe '#now' do
  it 'tells the plane whether it\'s safe to take off' do
    allow(subject).to receive(:now) { 'stormy' }
    expect(subject.now).to eq 'stormy'
  end
end
