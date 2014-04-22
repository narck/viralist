require 'spec_helper'

describe Visit do
	let(:company) { FactoryGirl.create(:company) }
    let(:store) { Store.create name:"Kamppi", id: "2", address:"Katu 1", zip:"11111", company_id: company.id, threshold: 15}
    let(:user){ FactoryGirl.create(:user) }

	it "is correctly saved" do 
		visit = Visit.create visitdate: DateTime.now, note:"Yeah", user: user, store: store
		expect(store.visits).not_to be_empty
	end

	it "correctly shows date since visited" do 
		visit = Visit.create visitdate: DateTime.now - 100, note:"Yeah", user: user, store: store
		expect(visit.days_since).to eq(100)
	end

	it "correctly shows date since visited with large differences" do 
		visit = Visit.create visitdate: DateTime.now - 100000000, note:"Yeah", user: user, store: store
		expect(visit.days_since).to eq(100000000)
	end
  
end
