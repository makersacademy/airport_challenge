require 'weather'
describe Weather do

  context "I want to prevent takeoff when weather is stormy" do

    it 'Checks the 9 in 10 change the weather is not stormy' do
      expect(subject).to receive(:rand).and_return(12)
      expect(subject.stormy?).to eq false
    end


    it 'Checks the 1 in 10 change that the weather will be stormy' do
      expect(subject).to receive(:rand).and_return(10)
      expect(subject.stormy?).to eq true
    end

  end

end