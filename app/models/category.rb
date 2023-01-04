class Category < ApplicationRecord
  belongs_to :user
  has_many :transactions, dependent: :destroy
  validates :name, presence: true
  validates :icon, presence: true

  def total_amount
    # calculate and return the total amount for this category
    transactions.sum(:amount)
  end
end
