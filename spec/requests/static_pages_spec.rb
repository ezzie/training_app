require 'spec_helper'

describe "StaticPages" do
  
  let(:base_title) { "Ruby on Rails Training App" }
  
  describe "Home page" do
    it "should work" do
      get static_pages_home_path
      response.status.should be(200)
    end
    it "should have the content 'Training App'" do
      visit '/static_pages/home'
      page.should have_content('Training App')
    end
    it "should have the h1 'Home'" do
      visit '/static_pages/home'
      page.should have_selector('h1', :text => 'Home')
    end
    it "should have the base title" do
      visit '/static_pages/home'
      page.should have_selector('title', :text => "#{base_title}")
    end
    it "should not have a custom page title" do
      visit '/static_pages/home'
      page.should_not have_selector('title', :text => "| Home")
    end
  end
  
  describe "Help page" do
    it "should have the h1 'Help'" do
      visit '/static_pages/help'
      page.should have_selector('h1', :text => "Help")
    end
    it "should have the title 'Help'" do
      visit '/static_pages/help'
      page.should have_selector('title', :text => "#{base_title} | Help")
    end
  end
  
  describe "About page" do
    it "should have the h1 'About Us'" do
      visit '/static_pages/about'
      page.should have_selector('h1', :text => 'About Us')
    end
    it "should have the title 'About Us'" do
      visit '/static_pages/about'
      page.should have_selector('title', :text => "#{base_title} | About Us")
    end
  end
end
