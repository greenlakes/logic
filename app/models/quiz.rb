class Quiz < ApplicationRecord
    belongs_to :category
    has_many :questions, dependent: :destroy, inverse_of: :quiz
    accepts_nested_attributes_for :questions, reject_if: :all_blank, allow_destroy: true

    validates :title, presence: true
    validates :category, presence: true

end