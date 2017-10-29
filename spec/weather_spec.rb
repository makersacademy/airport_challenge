require 'weather'

describe Weather do

   it "should be rarely stormy " do
     array =[]
     10.times{array << Weather.stormy?}
     expect(array.count(false)).to be > 5
   end
   
end
