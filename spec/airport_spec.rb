require './lib/airport'

describe Airport do
  it "makes an instance of the Airport class" do
    airport = Airport.new
    expect(airport).to be_instance_of(Airport)
  end

  it { should respond_to(:land).with(1).argument}

  it { should respond_to(:take_off).with(1).argument}
end
