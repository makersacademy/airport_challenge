require 'weather'

describe Weather do
  context '#weather' do
    it 'returns sunny or stormy at random' do
      outputs = []

      until outputs.include?(:sunny) && outputs.include?(:stormy) do
        outputs.push(subject.weather)
      end

      outputs.each do |output|
        expect(output).to eq(:sunny).or eq(:stormy)
      end
    end
  end
end