require_dependency 'vote_validator'
class IssueVote < ActiveRecord::Base
  unloadable

  self.table_name = 'issue_votes'
  belongs_to :voteable, :polymorphic => true
  belongs_to :user, :class_name => 'User', :foreign_key => 'user_id'

  validates :user_id, :issue_id, presence: true
  validates_with VoteValidator

  attr_protected :id

#  def valid_vote?(user = User.current)
#    return if IssueVote.find(:user_id => user_id, :issue_id => issue_id)
#  end

end