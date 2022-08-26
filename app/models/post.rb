class Post < ApplicationRecord
    validates :title, presence: true, exclusion: {in: ["True Facts"]}
    validates :content, length: {minimum: 250}
    validates :summary, length: {maximum: 250}
    validates :category, inclusion: {in: ["Fiction", "Non-Fiction"]}

    validate :is_click_bait

    # create a regular expression with the valid texts that need to be in the title
    VALID_TEXT = [/Won't Believe/i, /Secret/i, /Top \d/i, /Guess/i]
    
    def is_click_bait
        if VALID_TEXT.none? { |text| text.match title }
            errors.add(:title, "Title is not clickbait")
        end
    end
end
