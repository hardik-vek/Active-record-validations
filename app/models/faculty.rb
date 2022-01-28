class Faculty < ApplicationRecord
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :phone_number, length: { is: 10 }, numericality: true
  validates :email, presence: true, uniqueness: true
  require "date"
  validates :birth_date, comparison: { less_than: Date.today, message: "can't be in future" }
  validates :designation, inclusion: { in: %w(Ass.Prof Prof), message: "%{value} is not valid designation" }, exclusion: { in: %w(HOD Sr.Prof), message: "%{value} is reserved." }

  #   , if: :val?
  #   def val?
  #     inclusion: { in: %w(Ass. Prof,Prof)}
  #     exclusion: { in: %w(HOD,Sr. Prof)}
  #   end
end
