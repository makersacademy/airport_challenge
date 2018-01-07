require 'plane'

describe Plane do
  it { is_expected.to respond_to :land }

  it { is_expected.to respond_to :take_off }

  it 'returns grounded when landed' do
   expect(subject.land).to eq('grounded')
  end

  it 'returns grounded when taken off' do
    expect(subject.take_off).to eq('flying')
  end
end
