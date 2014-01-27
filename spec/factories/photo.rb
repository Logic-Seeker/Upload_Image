include ActionDispatch::TestProcess
FactoryGirl.define do
  factory :photo do |t|
    t.title "gyro"
    t.image {fixture_file_upload( Rails.root + 'spec/image/Addtional_Question_Excel.png','img/jpeg') }
  end
end
