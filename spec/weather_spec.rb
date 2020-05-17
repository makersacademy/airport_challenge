require 'weather'

describe Weather do

  subject { Weather.new }

  it 'returns clear when rand is less than 8' do
    allow(subject).to receive(:rand) { 7 }
    expect(subject.forecast).to be false
  end

  it 'returns stormy when rand is more than 7' do
    allow(subject).to receive(:rand) { 8 }
    expect(subject.forecast).to be true
  end

end
