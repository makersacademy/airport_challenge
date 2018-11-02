require 'weather'

describe Weather do
    it 'weather only returns true or false' do
      expect(subject.stormy?).to eq(true).or eq(false)
    end
end
