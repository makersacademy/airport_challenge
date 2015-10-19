require 'weather'

describe Weather do

  before{
    allow(subject).to receive(:stormy?).and_return(true)
  }
  it 'checks if the weather is stormy or not' do
    expect(subject.stormy?).to eq(true)
  end
end
