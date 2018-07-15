require 'weather'
describe Weather do 
  it "responds to generate method" do 
  expect(subject).to respond_to(:generate)
 end 
end 

