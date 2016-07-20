class TransactionSerializer < ActiveModel::Serializer
  attributes :id, :credit_card_number, :credit_card_expiration_date, :result, :invoice_id
end
