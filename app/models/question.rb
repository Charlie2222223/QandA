class Question < ApplicationRecord

  # バリデーションチェック
  validate :title, presence: true
  validate :name, presence: true
  validate :content, presence: true, length: { minimum: 5 }
end
