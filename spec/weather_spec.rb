require 'weather'

describe Weather do
  it "Allows the user to create an instance of Weather" do
    expect(subject).to be_an_instance_of(Weather)
  end
  it 'responds to #generate' do
    expect(subject).to respond_to :generate
  end
  it "give a result of 1 = stormy or 2 to 6 = sunny" do
    expect(subject.generate).to be_between(1,6)
  end
end
