require "rails_helper"

RSpec.describe User, type: :model do
  describe "test validate" do
    context "email is not same" do
      before do
        FactoryGirl.create(:user, email: "trinh@gmail.com", password: "aaaaaaaa")
      end

      let(:user) {FactoryGirl.build(:user)}
      it {expect(user).to be_invalid}
    end

    context "test email type error" do
      let(:user) {FactoryGirl.build(:user)}
      it {expect(user).to_not allow_value("abc.com").for(:email)}
      it { expect(user).to allow_value("dhh@noc.com").for(:email) }
    end

    context "test password less than 8 character" do  
      subject {FactoryGirl.create :user}
      before {subject.password = 123456}
      it {is_expected.to have(1).error_on(:password)}
    end

    context "test email not nil" do
      let(:user) {FactoryGirl.build(:user, email: nil)}
      it {expect(user).to be_invalid}
    end

    context "test password not nil" do
      let(:user) {FactoryGirl.build(:user, password: nil)}
      it {expect(user).to be_invalid}
      it { expect(user).to validate_confirmation_of(:password) }
    end
  end

  describe "test associations" do
    context "test have_many"
    let(:user) {FactoryGirl.build(:user)}
    it {expect(user).to have_many(:reviews).dependent(:destroy)}
    it {expect(user).to have_many(:comments).dependent(:destroy)}
    it {expect(user).to have_many(:favourites).dependent(:destroy)}
    it {expect(user).to have_many(:requests).dependent(:destroy)}
    it {expect(user).to have_many(:read_states).dependent(:destroy)}
    it {expect(user).to have_many(:books)}
  end
end
