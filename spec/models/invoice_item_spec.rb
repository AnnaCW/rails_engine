require 'rails_helper'

RSpec.describe InvoiceItem, type: :model do
  it { should belong_to (:invoice) }
  it { should belong_to (:item) }
  it { should validate_presence_of (:quantity) }
  it { should validate_presence_of (:item) }
  it { should validate_presence_of (:invoice) }
end
