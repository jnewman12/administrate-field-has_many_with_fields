require "administrate/field/has_many_with_fields"
require "rails_helper"
# require "administrate/field/has_many"
# require "support/constant_helpers"
# require "support/mock_relation"


RSpec.describe Administrate::Field::HasManyWithFields do
  describe "#to_partial_path" do
    it "returns a partial based on the page being rendered" do
      page = :show
      items = double
      field = Administrate::Field::HasManyWithFields.new(:items, items, page)

      path = field.to_partial_path

      expect(path).to eq("/fields/has_many_with_fields/#{page}")
    end
  end

  it "returns an index page for the dashboard of the associated attribute" do
    customer = build(:customer)
    field = Administrate::Field::HasManyWithFields.new(
      :orders,
      Order.all,
      :show,
      resource: customer,
    )

    page = field.associated_collection

    expect(page).to be_instance_of(Administrate::Page::Collection)
  end

  # it "should only render certain fields of the collection" do

  # end
end