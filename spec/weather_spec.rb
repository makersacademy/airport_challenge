require 'weather'

describe Weather do

  describe 'stormy?' do
    it 'there is 20% possibility of storm' do
      srand(1)
      rand
      rand
      expect(subject.stormy?).to be true
    end
  end

end