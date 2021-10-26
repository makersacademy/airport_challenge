require './lib/plane.rb'
describe Plane do 
  before(:each) do 
    @plane = Plane.new
  end 

  it "creates an instance of plane class when called" do
    expect(@plane).to eq(@plane)
  end 
end
