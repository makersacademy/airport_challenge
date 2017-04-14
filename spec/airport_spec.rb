require './lib/airport'

describe Airport do

  it 'has weather' do
    expect(subject).to respond_to(:weather)
  end

  it '#weather can be #sunny or #stormy' do
    expect(subject.weather).to eq("Sunny").or(eq("Stormy"))
  end

end
