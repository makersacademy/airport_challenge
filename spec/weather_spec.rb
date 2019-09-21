require "weather"

describe Weather do

    describe '#initialize' do
      it "if it is stormy, it is stormy" do
      allow_any_instance_of(Weather).to receive(:rand).and_return(2)
      expect(subject.stormy?).to eq true
    end
  end

end
