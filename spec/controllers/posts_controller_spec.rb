require 'rails_helper'

RSpec.describe PostsController, type: :controller do

  let(:valid_attributes) {
    skip(description: 'post2')
  }

   describe 'GET new' do
   it "assigns all post as @post" do
      get :new, { :category_id => @category}, valid_attributes 

      expect(assigns(:posts)).to be_new([post])
    end
   
  end
end
