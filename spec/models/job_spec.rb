require 'spec_helper'

describe Job do

  describe 'validation tests' do 
    it { should have_valid(:name).when("Mike") }
    it { should_not have_valid(:name).when(nil, "") }

    it { should have_valid(:email).when('r4eth@yahoo.com') }
    it {should_not have_valid(:email).when(nil, '', 'user.com', 'user', '.com', 'my@com', 'user@ecncom') }
       
    it { should have_valid(:job_title).when("valet attendant") }
    it { should_not have_valid(:job_title).when(nil, "") }

    it { should have_valid(:location).when("Boston") }
    it { should_not have_valid(:location).when(nil, "") }

    it { should have_valid(:description).when("you gotta drive a car and park it") }
    it { should_not have_valid(:description).when(nil, "") }

    it { should have_valid(:contact_phone_number).when(6179388117) }
    it {should_not have_valid(:contact_phone_number).when(nil, '', '4', '455595', 'string') }
  end

  pending "add some examples to (or delete) #{__FILE__}"
end
