require 'airport'
describe Airport do 

  it "can create an instance of itself" do
    subject = Airport.new
    expect(subject).to be_an_instance_of(Airport)
  end

end
