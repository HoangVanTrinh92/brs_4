require "rails_helper"

RSpec.describe Comment, type: :model do
  describe "test validate" do
    before do
      @user = FactoryGirl.build :user
      @review = FactoryGirl.build :review, user: @user
      @comment = FactoryGirl.build :comment, user: @user, review: @review
    end

    context "test validate" do
      it "test comment content not nil" do
        @comment.content = nil
        expect(@comment).to be_invalid
      end
    end

    context "test Associations" do
      it {expect(@comment).to belong_to(:user)}
      it {expect(@comment).to belong_to(:review)}
    end
  end
end