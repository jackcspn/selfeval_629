class Testrecs < ApplicationRecord
  serialize :correctness, ActionController::Parameters
  serialize :answers, ActionController::Parameters
  serialize :questions, ActionController::Parameters
  serialize :mark, ActionController::Parameters
  serialize :seltopics, ActionController::Parameters
  serialize :alltopics, ActionController::Parameters
end
