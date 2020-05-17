require 'weather'

describe Weather do

  subject { Weather.new }
  it 'when number is 5 weather returns stormy' do
     allow(subject).to receive(:number) { 5 }
     expect(subject.forecast).to eq('stormy')
   end

  subject { Weather.new }
  it 'when numbers 1 weather returns sunny' do
    allow(subject).to receive (:number) {1}
    expect(subject.forecast).to eq('sunny')
  end
end
