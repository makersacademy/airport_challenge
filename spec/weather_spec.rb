require 'weather.rb'

describe Weather do
  it 'returns a value of one' do
    subject.stub(:stormy) { 1 }
    expect(subject.stormy).to eq 1
  end
end
