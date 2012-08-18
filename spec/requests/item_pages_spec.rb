require 'spec_helper'

describe "Item pages" do

  subject { page }

  let(:user) { FactoryGirl.create(:user) }
  before { sign_in user }

  describe "item creation" do
    before { visit root_path }

    describe "with invalid information" do

      it "should not create an item" do
        expect { click_button "Add" }.should_not change(Item, :count)
      end

      describe "error messages" do
        before { click_button "Add" }
        it { should have_content('error') }
      end
    end
  
    describe "with valid information" do
    
      before { fill_in 'item_description', with: "Lorem ipsum" }
      before { fill_in 'item_price', with: 9.99 }
      it "should create an item" do
        expect { click_button "Add" }.should change(Item, :count).by(1)
      end
    end
  end

  describe "item destruction" do
    before { FactoryGirl.create(:item, user: user) }

    describe "as correct user" do
      before { visit root_path }

      it "should delete an item" do
        expect { click_link "delete" }.should change(Item, :count).by(-1)
      end
    end
  end
end

