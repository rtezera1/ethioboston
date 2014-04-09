require 'spec_helper'

describe Housing do

  describe 'validation test' do 
  
    it { should have_valid(:type_of_housing).when('1 Bedroom') }
    it {should_not have_valid(:type_of_housing).when(nil, '') }

    it { should have_valid(:city).when('chelsea') }
    it {should_not have_valid(:city).when(nil, '') }

    it { should have_valid(:state).when('Massachusetts', 'MA') } 
    it {should_not have_valid(:state).when(nil, '', '11', '@$#') }

    it { should have_valid(:price).when(1000) }
    it {should_not have_valid(:price).when(nil, '', 'ten') }


    it { should have_valid(:contact_number).when(6179388117) }
    it {should_not have_valid(:contact_number).when(nil, '', 4, 45559, 'string') }

    it { should have_valid(:contact_email).when('r4eth@yahoo.com') }
    it {should_not have_valid(:contact_email).when(nil, '', 'user.com','user', '.com', 'my@com', 'user@ecncom') }
 end
 
  pending "add some examples to (or delete) #{__FILE__}"
end
