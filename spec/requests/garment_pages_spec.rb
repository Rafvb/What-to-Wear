require 'spec_helper'

describe "Garment pages" do

  subject { page }

  let(:user) { FactoryGirl.create(:user) }
  before { sign_in user }

  describe "garment creation" do
    before { visit root_path }

    describe "with invalid information" do

      it "should not create a garment" do
        expect { click_button "Add" }.should_not change(Garment, :count)
      end

      describe "error messages" do
        before { click_button "Add" }
        it { should have_content('error') }
      end
    end
  
    describe "with valid information" do
    
      before { fill_in 'garment_description', with: "Lorem ipsum" }
      it "should create a garment" do
        expect { click_button "Add" }.should change(Garment, :count).by(1)
      end
    end
  end

  describe "garment destruction" do
    before { FactoryGirl.create(:garment, user: user) }

    describe "as correct user" do
      before { visit root_path }

      it "should delete a garment" do
        expect { click_link "delete" }.should change(Garment, :count).by(-1)
      end
    end
  end
end

