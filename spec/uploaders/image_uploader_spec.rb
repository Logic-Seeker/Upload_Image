require 'spec_helper'
require 'carrierwave/test/matchers'

describe ImageUploader do
  include CarrierWave::Test::Matchers

  before do
    @photo = FactoryGirl.create(:photo)
  end

  context 'the normal version' do
    it "should scale down a landscape image to be exactly 640 by 640 pixels" do
      @photo.image.should have_dimensions(640, 640)
    end
  end
  context 'the thumb version' do
    it "should scale down a landscape image to be exactly 150 by 150 pixels" do
      @photo.image.thumb.should have_dimensions(150, 150)
    end
  end
  context 'the medium version' do
    it "should scale down a landscape image to be exactly 310 by 310 pixels" do
      @photo.image.medium.should have_dimensions(310, 310)
    end
  end


end

