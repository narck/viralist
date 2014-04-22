require 'spec_helper'

describe Company do
    let(:store){ FactoryGirl.create(:store) }
    let(:company){ FactoryGirl.create(:company) }
	

  it "correctly sees it's contacts" do
    contact = Contact.create fname:"Budge", lname:"Hooks", company_id: company.id, email:"asd@com.com", phone:"1234567"
    expect(company.contacts).not_to be_empty
    
  end
end
