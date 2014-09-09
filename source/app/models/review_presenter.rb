class ReviewPresenter
  def initialize(review)
    @review = review
  end

  def change_to_hash
    all_reviews = []
    @review.each do |rev|
        review = {}
        review["rev"] = rev
        review["votes"] = rev.votes
        review["comments"] = rev.comments 
        all_reviews << review 
      end
      return all_reviews
  end

end