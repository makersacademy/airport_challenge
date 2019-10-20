require 'weather'

describe Weather do
  let(:weather) {Weather.new}

  it {is_expected.to respond_to(:stormy?)}

  # it "it only returnns number between 1 and 10" do
  #   expect(weather.stormy?).to be_between(1,10)
  # end
  #
  # it "does weatehr call a random number between 1 and 10?" do
  #   srand(100)
  #   num = rand(1..10)
  #   expect(weather.stormy?).to eq num
  # end

  it 'does weather return false if numbers are 7 or below?' do
      srand(12) #random number will 7
      expect(weather.stormy?).to eq false
  end

  it 'does weather return true if random number is 8 or above?' do
      srand(4) #random number will 8
      expect(weather.stormy?).to eq true
  end




end
