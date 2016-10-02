require 'airport.rb'

describe Airport do

  it "should respond to method land" do
    expect(subject).to respond_to :land
  end

  it { is_expected.to respond_to :land}

end
