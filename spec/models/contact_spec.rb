require 'spec_helper'

describe Contact do
  let(:company){FactoryGirl.create(:company)}

  it "is correctly saved" do
  	contact = Contact.create fname:"Budge", lname:"Hooks", company_id: company.id, email:"asd@com.com", phone:"1234567"

  	expect(Contact.first).to eq(contact)
  end

  it "is not saved with missing parameters" do
	contact = Contact.create fname:"Budge", lname:"Hooks", company_id: company.id, email:"asd@com.com"
	expect(Contact.count).to eq(0)  
	contact = Contact.create fname:"Budge", lname:"Hooks", company_id: company.id, phone:"1234567"
	expect(Contact.count).to eq(0)
	contact = Contact.create company_id: company.id, email:"asd@com.com", phone:"1234567"
	expect(Contact.count).to eq(0)
  end

  it "is visible in company contact list after created" do
  	contact = Contact.create fname:"Budge", lname:"Hooks", company_id: company.id, email:"asd@com.com", phone:"1234567"

  	expect(company.contacts.first).to eq(contact)
  end
end
