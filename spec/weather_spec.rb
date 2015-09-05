require 'weather'    # ~> LoadError: cannot load such file -- weather
describe Weather do



   it 'should respond to forecast' do
     expect(subject).to respond_to :forecast
   end

# I dont think I needed to do the two below tests because this isnt user interaction ????

   it 'should be able to be stormy' do
     expect(subject).to respond_to :stormy
   end

   it 'should be able to to be sunny ' do
     expect(subject).to respond_to :sunny
   end


 #   it "This will be a quick test" do
 #    some_text = subject.hi
 #   expect(some_text).to include("Hi there")
 # end


end
