describe Weather do
  class Myclass
    extend Weather
  end

  describe '#stormy' do
    it "should define if the weather is stormy" do
      allow(Myclass).to receive(:stormy).and_return(false)
      expect(Myclass.stormy). to eq false
    end
    end
  end
