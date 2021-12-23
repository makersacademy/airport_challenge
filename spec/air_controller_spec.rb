require "air_controller"

describe Aircontroller do

  it "allows plane to land if weather is sunny " do
    air_controller = Aircontroller.new
    air_controller_land = air_controller.land
    expect(air_controller.land).to eq("sunny")
  end


  it "allows plane to land if  fleet not full" do

  end 
  
  
  
  

end
