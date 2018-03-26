require 'mockingtest'

describe Zoo do
  it 'zoo is full' do
  thing = double(:full? => false)
  #allow(subject).to receive(:full?).and_return(false)
  expect(thing.full?).to eq false
  end
end
