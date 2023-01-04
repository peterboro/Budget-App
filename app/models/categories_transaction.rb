class CategoriesTransaction < ApplicationRecord
  belongs_to :category
  belongs_to :transaction_record_item, class_name: 'Transaction'
end
