require 'airport'
require 'weather'

describe Weather do
  it 'responds to the .stormy? method' do
    expect(subject).to respond_to(:stormy?)
  end

  describe '.stormy?' do
    context 'after running 100 times' do
      it 'can return true' do
        stormy_test = []
        100.times { stormy_test << subject.stormy? }
        expect(stormy_test).to include(true) 
      end

      it 'can return false' do
        stormy_test = []
        100.times { stormy_test << subject.stormy? }
        expect(stormy_test).to include(false) 
      end
    end
  end
end
