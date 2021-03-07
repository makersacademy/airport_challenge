require './lib/airport.rb'

describe Airport do

  it 'answers if full' do
    expect(subject).to respond_to(:full?)
  end

  it 'shows if full' do
    expect(subject.full?).to eq("full")
  end
end
