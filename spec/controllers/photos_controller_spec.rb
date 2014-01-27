require 'spec_helper'

describe PhotosController do
  context "with valid attributes" do 
    it "creates a new photo" do 
      expect{ 
	post :create, photo: FactoryGirl.attributes_for(:photo) }.to change(Photo,:count).by(1) 
    end 
  end
  context "with invalid attributes" do 
    it "creates does not create a new photo" do 
      expect{ 
	post :create, photo: FactoryGirl.attributes_for(:photo , title: "") }.to change(Photo,:count).by(0) 
    end 
  end

end
