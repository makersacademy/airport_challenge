require 'weather'

describe Weather do

  let(:extended_class) { Class.new { extend Weather } }


  describe 'stormy?' do
    it 'there is 20% possibility of storm' do
      srand(1)
      rand
      rand
      expect(extended_class.stormy?).to be true
    end
  end

end