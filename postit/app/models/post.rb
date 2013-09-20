class Post < ActiveRecord::Base
	BADWORDS = ['bad', 'words']
  belongs_to :user
  has_many :comments
  has_many :post_categories
  has_many :categories, through: :post_categories
  has_many :votes, as: :voteable

  validates :title, presence: true, length: {minimum: 5}
  validate :bad_words

  def bad_words
  	title.split(' ').each do |word|
  		if BADWORDS.include?(word)
  			errors.add(:title, "can't contain bad words")
  			break
  		end
  	end
  end

  def total_votes
    self.votes.where(vote: true).size - self.votes.where(vote: false).size
  end

end
