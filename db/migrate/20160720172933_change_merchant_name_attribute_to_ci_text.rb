class ChangeMerchantNameAttributeToCiText < ActiveRecord::Migration[5.0]
  enable_extension 'citext'
  
  def change
    change_column :merchants, :name, :citext
  end
end
