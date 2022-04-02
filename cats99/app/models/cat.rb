require "action_view"
class Cat < ApplicationRecord
    include ActionView::Helpers::DateHelper
    validates :color, inclusion: {in:%w(White Black Orange Gray),
        message: "Not a valid color. Please provide a valid color."}
    validates :sex, inclusion: {in:%w(M F),
        message: "Not a valid sex. Please provide using \"M or \"F."}

    has_many :rentals,
        foreign_key: :cat_id,
        class_name: :CatRentalRequest

    def age
        (Date.current - self.birth_date).to_i / 365
    end
end
