require 'weather'

RSpec.describe Weather do
  it 'randomly generates stormy weather' do
    allow(subject).to receive(:rand).and_return(8)
    expect(subject.forecast).to eq :stormy
  end

  it 'randomly generates sunny weather' do
    allow(subject).to receive(:rand).and_return(2)
    expect(subject.forecast).to eq :sunny
  end
end
