require 'spec_helper'

describe "Static Pages" do

  describe "Home page" do

    it "should have the content 'What to Wear'" do
      visit '/static_pages/home'
      page.should have_selector('h1', :text => 'What to Wear')
    end

    it "should have the right title" do
      visit '/static_pages/home'
      page.should have_selector('title',
                                :text => "What to Wear | Home")
    end
  end

  describe "Help page" do

    it "should have the content 'Help'" do
      visit '/static_pages/help'
      page.should have_selector('h1', :text => 'Help')
    end

    it "should have the right title" do
      visit '/static_pages/help'
      page.should have_selector('title',
                                :text => "What to Wear | Help")
    end
  end

  describe "About page" do

    it "should have the content 'About Us'" do
      visit '/static_pages/about'
      page.should have_selector('h1', :text => 'About Us')
    end

    it "should have the right title" do
      visit '/static_pages/about'
      page.should have_selector('title',
                                :text => "What to Wear | About")
    end
  end
end
