require 'weather'

describe Weather do
  it { should respond_to :stormy }
end

describe '#stormy' do
  it 'tells the plane whether it\'s safe to take off' do
    allow(subject).to receive(:stormy) 
  end
end
