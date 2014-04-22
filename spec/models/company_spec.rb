require 'spec_helper'

describe Company do
    let(:store){ FactoryGirl.create(:store) }
    let(:company){ FactoryGirl.create(:company) }
	

  it "correctly sees it's contacts" do
    contact = Contact.create fname:"Budge", lname:"Hooks", company_id: company.id, email:"asd@com.com", phone:"1234567"
    expect(company.contacts).not_to be_empty
  end

  it "lists no contacts if none are set" do
  	expect(company.contacts).to be_empty
  end

  describe "when primary contact is set" do 
  	it "correctly shows it" do 
	  	contact = Contact.create fname:"Budge", lname:"Hooks", company_id: company.id, email:"asd@com.com", phone:"1234567"
  		company.contact = contact

  		expect(company.contact.to_s).to eq(contact.to_s)
  	end
  end
end
