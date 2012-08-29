require 'spec_helper'

describe Item do

  let(:user) { FactoryGirl.create(:user) }
  before do
    @item = user.items.build(description: "Blue T-Shirt",
                             price: 9.99,
                             brand: "Esprit",
                             date_bought: Date.parse("2012-04-22"))
  end

  subject { @item }

  it { should respond_to(:description) }
  it { should respond_to(:price) }
  it { should respond_to(:brand) }
  it { should respond_to(:date_bought) }
  it { should respond_to(:user_id) }
  it { should respond_to(:user) }
  its(:user) { should == user }

  it { should be_valid }
  
  describe "when user_id is not present" do
    before { @item.user_id = nil }
    it { should_not be_valid }
  end

  describe "accessible attributes" do
    it "should not allow access to user_id" do
      expect do
        Item.new(user_id: user.id)
      end.should raise_error(ActiveModel::MassAssignmentSecurity::Error)
    end
  end

  describe "when user_id is not present" do
    before { @item.user_id = nil }
    it { should_not be_valid }
  end

  describe "with blank description" do
    before { @item.description = " " }
    it { should_not be_valid }
  end

  describe "with description that is too long" do
    before { @item.description = "a" * 256 }
    it { should_not be_valid }
  end

  describe "with date bought nil" do
    before { @item.date_bought = nil }
    it { should_not be_valid }
  end

  describe "with blank price" do
    before { @item.price = " " }
    it { should_not be_valid }
  end
end
