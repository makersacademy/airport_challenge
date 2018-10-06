require 'weather'

describe Weather do
  describe '#stormy' do
    it 'is true' do
      weather = Weather.new(true)
      expect(weather).to be_stormy
    end

    it 'is false' do
      weather = Weather.new(false)
      expect(weather).not_to be_stormy
    end

  end

  # describe '#random_boo' do
  #   it 'returns true or false' do
  #     expect(subject.random_boo(1,4)).to be_kind_of(Boolean.new)
  #   end
  # end

end
