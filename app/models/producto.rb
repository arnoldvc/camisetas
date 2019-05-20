class Producto < ApplicationRecord
	validates :cantidad, presence: true
	validates :nombre, length: { minimum: 5 }
end
