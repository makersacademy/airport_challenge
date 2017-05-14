require 'airplane'
describe Airplane do
  it "Shows that an instance of Airplane responds to the  check_current_status method" do
    expect(subject).to respond_to :check_current_status
  end
  it "Shows that an instance of Airplane reponds to the take_off method" do
    expect(subject).to respond_to :take_off
  end
  it "Shows that the take_off methods changes the current_status instance variable to airborne" do
    expect(subject.take_off).to eq "airborne"
  end
  it "Shows that an instance of the Airplane class responds to the land method" do
    expect(subject).to respond_to :land
  end
  it "Shows that the land method changes the current_status instance variable to grounded" do
    expect(subject.land).to eq "grounded"
  end
  it "Shows that by default the  check_current_status method will return grounded" do
    expect(subject. check_current_status).to eq "airborne"
  end
  it "Shows that the  check_current_status method will return grounded if the land method is called and airborne when the take_off method is called" do
    subject.take_off
    expect(subject. check_current_status).to eq "airborne"
    subject.land
    expect(subject. check_current_status).to eq "grounded"
  end
  # it "shows that the airplane wil respond to the request_permission_to_land method" do
  #   expect(subject).to respond_to :request_permission_to_land
  # end
end
