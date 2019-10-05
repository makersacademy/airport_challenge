require 'weather'

describe 'Weather' do
  it "should respond to the stormy weather" do
    expect { subject.to respond_to :stormy? }
  end
end
