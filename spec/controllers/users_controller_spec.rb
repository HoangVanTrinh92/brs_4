require "rails_helper"

RSpec.describe Admin::UsersController, type: :controller do
  describe "GET #index" do
    context "renders the index template" do
      let(:user) {User.create(email: "trinh@gmail.com", password: "12345678", role: "admin")}
      it do 
        sign_in user
        get :index
        expect(response).to be_success
      end  
    end
  end
end