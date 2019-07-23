class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: {minimum: 15}
  validates :summary, length: {maximum: 20}
  validates :category, inclusion: {in: %w(Fiction Non-Fiction)}
<<<<<<< HEAD
  validate :title_is_clickbait, if: :title_present?

  def title_present?
    title.present?
  end

  def title_is_clickbait
    clickbait_words = ["Won't Believe", "Secret", "Guess"]
    if !(clickbait_words.any? {|word| title.include?(word)} || title.match(/Top\sd+/))
=======
  validate :title_is_clickbait, if: title.present?

  def title_is_clickbait
    clickbait_words = ["Won't Believe", "Secret", "Guess", /Top\sd+/]
    if
      !clickbait_words.any? do |word|
        title.include?(word)
      end
>>>>>>> 304aedff4ce8c1c6bd29fbb3bf8a8b35f9e28431
      errors.add(:title, "must be clickbait-y")
    end
  end
end
