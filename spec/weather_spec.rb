require 'weather'

describe Weather do
  describe '#generates' do
    it 'method' do
      expect(subject).to respond_to(:generates)
    end

    it "returns nil from allowed messages" do
      weather = double (subject)
      allow(weather).to receive(:generates).and_return(:stormy)
    end
  end 
end