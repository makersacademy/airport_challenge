require 'weather'

describe '#weather' do 
  
  it 'returns mostly sunny' do 
    expected = Array.new(91, :sunny)
    actual = []
    91.times do |i| 
      # rand is implemented in Kernel. But calling it, the receiver is our Object.
      # https://stackoverflow.com/questions/45761380/how-to-stub-rand-in-rspec
      allow_any_instance_of(Object).to receive(:rand) { i }
      actual << weather
    end
    expect(actual).to eq expected
  end

  it 'returns sometimes stormy' do
    expected = Array.new(10, :stormy)
    actual = []
    10.times do |i| 
      allow_any_instance_of(Object).to receive(:rand) { i + 91 }
      actual << weather
    end
    expect(actual).to eq expected
  end

end
