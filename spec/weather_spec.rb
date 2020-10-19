system 'clear'
require 'weather'
require 'airport'
require 'plane'

RSpec.describe 'weather' do # what does the RSpec do?
# begin - stormy method
  describe 'weather is stormy' do
# begin - instances of stormy method
    it 'planes cannot land if stormy' do

    end

    it 'planes cannot takeoff if stomry' do

    end
# end  - instances of stormy method
  end 
# end - stormy method

# begin - clear method
  describe 'weather is sunny' do
# begin - instance of a method
    it 'all plans can land in sunny weather' do

    end

    it 'all planes can takeoff in sunny weather' do

    end
# end - instance of a method
  end
# end - clear method
end
