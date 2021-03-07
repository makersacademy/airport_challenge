require './lib/airport.rb'

describe Airport do

  it 'answers if full' do
    expect(subject.full?).to eq(true)
  end

  it 'has default capacity' do
    expect(subject).to have_exactly(Airport::DEFAULT_CAPACITY).items
  end

end
