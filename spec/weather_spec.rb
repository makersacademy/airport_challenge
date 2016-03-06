require 'weather'

describe Weather do

  describe 'stormy?' do
    it 'expects to return true when it is stormy' do
      allow(subject).to receive(random_number).and_return(5)
    expect(subject.stormy?).to be true
  end

end
