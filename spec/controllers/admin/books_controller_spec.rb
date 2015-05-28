require "rails_helper"

RSpec.describe Admin::BooksController, type: :controller do

  describe "GET index" do
    it "responds successfully with an HTTP 200 status code" do
      get :index
      expect(response).to be_success
    end

    context "when admin logged in" do
      before do
        get :index
      end
      it {is_expected.to render_template :index}
    end
  end

  describe "POST create" do
    let(:book) {FactoryGirl.create(:book)}
    context "with valid attributes" do
      it "creates  a new book" do
        expect{
          post :create, book: FactoryGirl.attributes_for(:book)
        }.to change(Book,:count).by(1)
      end

      it "redirects to the new book" do
        post :create, book: FactoryGirl.attributes_for(:book)
        expect(response).to redirect_to admin_book_path(Book.last)
      end
    end

    context "with invalid attributes" do
      it "does not save the new book" do
        expect{
          post :create, book: FactoryGirl.attributes_for(:invalid_book)
        }.to_not change(Book,:count)
      end

      it "re-renders the new method" do
        post :create, book: FactoryGirl.attributes_for(:invalid_book)
        expect(response).to render_template :new
      end
    end
  end

  describe "PUT update" do
    let(:trinh) {FactoryGirl.create(:book)}

    context "valid attributes" do
      it "redirects to the book path" do
        put :update, id: trinh, book: FactoryGirl.attributes_for(:book, title: "sach2")
        expect(response).to redirect_to admin_book_path(trinh)
      end
    end

    context "change book attributes" do
      it "change book title" do
        book = FactoryGirl.create(:book)
        put :update, id: trinh, book: FactoryGirl.attributes_for(:book, title: "sach3")
        expect(assigns(:book).title).to eq 'sach3'
      end
    end
  end
end