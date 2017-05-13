require 'airplane'
describe Airplane do
  it "Shows that an instance of Airplane responds to the current_status method" do
    expect(subject).to respond_to :current_status
  end
end
