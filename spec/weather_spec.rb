require './docs/weather'

describe Weather do

it "should be true when random is less than 10 " do
       allow(subject).to receive(:rand).and_return(97)
       expect(subject.random_weather).to eq 'stormy'
   end
end