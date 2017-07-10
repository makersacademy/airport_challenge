require 'weather'

describe Weather do

  it 'determines if it is stormy or not' do
      allow(subject).to receive(:new).and_return(true)
      expect(subject.new).to eq true
  end
end
