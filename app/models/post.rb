class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: {minimum: 15}
  validates :summary, length: {maximum: 20}
  validates :category, inclusion: {in: %w(Fiction Non-Fiction)}
  validate :title_is_clickbait, if: :title_present?

  def title_present?
    title.present?
  end

  def title_is_clickbait
    clickbait_words = ["Won't Believe", "Secret", "Guess"]
    if !(clickbait_words.any? {|word| title.include?(word)} || title.match(/Top\sd+/))
      errors.add(:title, "must be clickbait-y")
    end
  end
end
