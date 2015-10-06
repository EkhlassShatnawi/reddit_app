require 'rails_helper'
#require 'support/devise'

RSpec.describe Admin::CategoriesController, type: :controller do
  #@request.env["devise.mapping"] = Devise.mappings[:user]
  let(:valid_session) { {} }
  let(:valid_attributes) {
    skip(title: 'cat22')
  }

  let(:invalid_attributes) {
    skip(title: '')
  }
  describe 'GET index' do
   it "assigns all category as @category" do
      category = Category.create valid_attributes
      get :index, {}, valid_session
      expect(assigns(:categories)).to eq([category])
    end
   
  end
  describe 'GET new' do
    it 'its return istanse of category' do
      get :new, {}
      expect(assigns(:category)).to be_a_new(Category)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new category" do
        expect {
          post :create, {:category => valid_attributes}
        }.to change(Category, :count).by(1)
      end

      it "redirects to the created category" do
        post :create, {:category => valid_attributes}, valid_session
        expect(response).to redirect_to(Category.last)
      end
    end

    describe "with invalid params" do
     
      it "re-renders the 'new' template" do
        post :create, {:category => invalid_attributes}, valid_session
        expect(response).to render_template("new")
      end
    end
  end
describe "PUT update" do
  describe "with valid params" do
      let(:new_attributes) {
        skip(title: 'cat6')
      }

      it "updates the requested category" do
        category = Category.create! valid_attributes
        put :update, {:id => category.to_param, :category => new_attributes}, valid_session
        category.reload
        #skip("Add assertions for updated state")
      end
      it "redirects to the category" do
        category = Category.create! valid_attributes
        put :update, {:id => category.to_param, :category => valid_attributes}, valid_session
        expect(response).to redirect_to(admin_categories_path)
      end
    end

      describe "with invalid params" do
      it "assigns the category as @category " do
        category = Category.create! valid_attributes
        put :update, {:id => category.to_param, :category => invalid_attributes}, valid_session
        expect(assigns(:category)).to eq(category)
      end

      it "re-renders the 'edit' template" do
        category = Category.create! valid_attributes
        put :update, {:id => category.to_param, :category => invalid_attributes}, valid_session
        expect(response).to render_template("edit")
      end
    end
end
end
