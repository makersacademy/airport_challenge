require 'weather'

describe Weather do
  describe 'responds to:' do
    it 'responds to stormy?' do
      expect(subject).to respond_to :stormy?
    end
  end
end
