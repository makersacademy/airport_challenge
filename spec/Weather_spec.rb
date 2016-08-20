describe Weather do

  it 'responds to the .stormy? method' do
    expect(subject).to respond_to(:stormy?)
  end

  describe 'random weather testing' do
    it "is stormy roughly 1 in every 10 'days'" do
      results = 0
      100000.times do
        weather = Weather.new
        if weather.stormy? == true
          results += 1
        end
      end
      puts results
      expect(results).to be_within(250).of(10000)
    end
  end
end
