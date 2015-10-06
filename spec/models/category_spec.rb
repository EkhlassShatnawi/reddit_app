require 'rails_helper'


RSpec.describe Category, type: :model do
  #pending "add some examples to (or delete) #{__FILE__}"
  it "is valid title" do
    category = Category.new(title: 'cat6')
    expect(category).to be_valid
  end
    it "is invalid title duplicate" do
    category = Category.create(title: 'cat6')
     category2 = Category.create(title: 'cat6')
    expect(category2).not_to be_valid
  end
      it "is invalid title nil" do
    category = Category.create(title: '')
    expect(category).not_to be_valid
  end
end
