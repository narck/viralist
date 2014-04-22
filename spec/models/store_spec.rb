require 'spec_helper'

describe Store do
	let(:company){ FactoryGirl.create(:company) }
	let(:user){ FactoryGirl.create(:user)}
	let(:store) { Store.create name:"Kamppi", id: "2", address:"Katu 1", zip:"11111", company_id: company.id, threshold: 15}
	let(:contact) { Contact.create fname:"Budge", lname:"Hooks", company_id: company.id, store_id: store.id, email:"asd@com.com", phone:"1234567" }
	
  
  it "has company set correctly" do
  	expect(store.company).to eq(company)
  end

  it "correctly lists contacts" do
  	a = Contact.create fname:"Budge", lname:"Hooks", company_id: company.id, store_id: store.id, email:"asd@com.com", phone:"1234567"
  	b = Contact.create fname:"Pudge", lname:"Books", company_id: company.id, store_id: store.id, email:"asd@com.com", phone:"1234567"
  	
  	expect(store.contacts.first).to eq(a)
  	expect(store.contacts.last).to eq(b)
  end

  describe "when primary contact is set" do 
  		it "correctly sees primary contact" do
		  	a = contact
		  	store.contact = a

		  	expect(store.contact.to_s).to eq(a.to_s)
		end
  end
  

  it "lists no contacs if no company contacts are set" do 
  	expect(store.contacts.count).to eq(company.contacts.count)
  end


  it "correctly shows latest visit" do 
		a = Visit.create visitdate: DateTime.now - 2, note:"Yeah", user: user, store: store
		b = Visit.create visitdate: DateTime.now - 5, note:"Yeah", user: user, store: store
		c = Visit.create visitdate: DateTime.now - 10, note:"Yeah", user: user, store: store

		expect(store.last_visited).to eq(2)
	end

	describe "with a set threshold" do 
		
		it "correctly shows if threshold has been exceeded" do 
			a = Visit.create visitdate: DateTime.now - 16, note:"Yeah", user: user, store: store
			b = Visit.create visitdate: DateTime.now - 18, note:"Yeah", user: user, store: store
			expect(store.threshold_exceeded).to be(true)
		end

		it "correctly shows if threshold is within limits" do 
			a = Visit.create visitdate: DateTime.now - 1, note:"Yeah", user: user, store: store
			expect(store.threshold_exceeded).to be(false)
		end


	end

end
