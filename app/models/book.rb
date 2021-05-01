class Book < ApplicationRecord
 #belong_to :author
 
validates :title, presence: {message: 'Judul harus diisi'}
validates :description, length: { minimum: 10, message: 'Minimal harus 10 karakter' }
validates :page, numericality: {greater_than: 10, message: 'Minimal jumlah halaman adalah 10'}
#validates :title, uniqueness: {case_sensitive: false}, if: :page_more_than_300
#validate :custom_validation, if: :page_more_than_300
#validates :price, numericality: {greater_than_or_egual_to: 100000}, if:  Proc.new {|b| b.page >= 300}

#def page_more_than_300
 # page >= 300
#end

  #def custom_validation
  #if page >= 300
#    if price <= 10000
 # errors.add(:price, 'harga minimal 10rb jumlah halaman 300 atau lebih')
  #end
#end
#end

def self.expensive
    where('price > 250000')
end

  def self.price_equal_more(price)
    where('price >=?',price)
  end
end