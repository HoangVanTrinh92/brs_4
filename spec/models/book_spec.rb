require "rails_helper"

RSpec.describe Book, type: :model do
  describe "test validate" do
    context "test book title not nil" do
      let(:book) {FactoryGirl.build(:book, title: nil)}
      it {expect(book).to be_invalid}
    end
  end

  describe "test Associations" do
    context "test have_many" do
      let(:book) {FactoryGirl.build(:book)}
      it {expect(book).to have_many(:reviews).dependent(:destroy)}
      it {expect(book).to have_many(:favourites).dependent(:destroy)}
      it {expect(book).to have_many(:read_states).dependent(:destroy)}
      it {expect(book).to have_many(:users).through(:favourites)}
    end
  end
end