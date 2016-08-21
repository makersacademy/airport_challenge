describe Weather do

  describe 'random weather testing' do
    it "is stormy roughly 1 in every 10 'days'" do
      times_stormy = 0
      trials = 100000

      trials.times do
        weather = Weather.new
        if weather.stormy? == true
          times_stormy += 1
        end
      end
      expect(times_stormy).to be_within(trials * 0.005).of(trials / 10) #tests if the weather is stormy to within 0.5% of 1 in 10 times
    end
  end
end
