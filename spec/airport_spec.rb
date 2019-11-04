require './lib/airport'

describe Airport do
  it "makes an instance of the Airport class" do
    airport = Airport.new
    expect(airport).to be_instance_of(Airport)
  end

  it { should respond_to(:land) }
  
end
