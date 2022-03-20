require "administrate/field/has_many_with_fields"
require "rails_helper"

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
end
