require 'airport'

describe Airport do
  it 'Returns true if weather is stormy' do
    weather = double("weather")
    allow(weather).to receive(:condition).and_return('stormy')
    # used .to eq over .to be_ for legibility
    expect(subject.stormy?(weather)).to eq(true)
  end
end
