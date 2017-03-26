class Question < ApplicationRecord
    has_many :answers, dependent: :destroy, inverse_of: :question
    belongs_to :quiz
    accepts_nested_attributes_for :answers, reject_if: :all_blank, allow_destroy: true
    validates :body, presence: true
    
end