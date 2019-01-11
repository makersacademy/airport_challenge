require 'weather'

describe Weather do

  it 'returns the a random weather condition when the condition method is called' do
    srand(10)
    expect(subject.condition).to eq "clear"
  end

end
