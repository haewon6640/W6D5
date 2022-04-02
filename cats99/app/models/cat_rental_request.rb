class CatRentalRequest < ApplicationRecord
    validates :cat_id, presence: true
    validates :start_date, presence: true
    validates :end_date, presence: true
    validates :status, presence: true, inclusion: {in:%w(Pending Approved Denied),
        message: "Not a valid status of the rental."}

    belongs_to :cat,
        dependent: :destroy
    
    def overlapping_requests
        
    end
end
