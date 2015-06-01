require "rails_helper"

RSpec.describe Review, type: :model do
  describe "test validate" do
    before do
      @user = FactoryGirl.build :user
      @review = FactoryGirl.build :review, user: @user
    end

    it "test review content not nil" do
      @review.content = nil
      expect(@review).to be_invalid
    end

    context "test Associations belongs_to" do
      it {expect(@review).to belong_to(:user)}
      it {expect(@review).to belong_to(:book)}
    end

    context "test Associations have_many" do
      it {expect(@review).to have_many(:comments).dependent(:destroy)}
    end
  end
end