require 'airport'

describe Weather do

	subject(:weather) { Weather.new }

  it "checks if weather is stormy" do
    expect(weather).to respond_to(:stormy?)
  end
  
end
