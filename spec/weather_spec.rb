require 'weather.rb'

describe Weather do

  it 'produces a random number between 1..100' do
    allow_any_instance_of(Weather).to receive(:rand).and_return(rand(0..100))
  end

  # it 'It flags as Stormy if random number == 20' do
  #   allow_any_instance_of(Weather).to receive(:rand).and_return(rand(20))
  #   expect(forecast).to eq 'Stormy'
  # end
end
