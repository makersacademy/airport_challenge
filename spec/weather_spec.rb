
require 'weather.rb'

describe Weather do
  
  it "can be either stormy or sunny" do
    expect(subject).to respond_to :is_stormy?
  end
end