require 'weather'

describe Weather do
  it 'generates stormy' do
    allow(subject).to receive(:rand).and_return(1)
    expect(subject.check).to eq('stormy')
  end

  it 'generates clear' do
    allow(subject).to receive(:rand).and_return(2)
    expect(subject.check).to eq('clear')
  end
end
