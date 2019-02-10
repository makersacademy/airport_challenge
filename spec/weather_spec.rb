require 'weather'

describe Weather do
  it 'is telling what is the weather' do
    expect(subject).to receive(:rand).and_return(2)
    expect(subject.forecast).to eq 2
  end
end
