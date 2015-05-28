require "rails_helper"

RSpec.describe BooksController, type: :controller do

  describe "GET index" do
    it "responds successfully with an HTTP 200 status code" do
      get :index
      expect(response).to be_success
    end

    context "when user logged in" do
      let(:user) {User.create(email: "trinh@gmail.com", password: "12345678", role: "admin")}
      before do
        sign_in user
        get :index
      end
      it { is_expected.to render_template :index }
      it { is_expected.to render_template :application }
    end
  end 
end