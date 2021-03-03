require 'rails_helper'

RSpec.describe Comment, type: :model do
  before do
    @comment = FactoryBot.build(:comment)
  end

  it 'textカラムが空の場合コメントは保存できない' do
    @comment.text = ''
    @comment.valid?
    expect(@comment.errors.full_messages).to include("Text can't be blank")
  end

  it 'userが紐付いていないとコメントは保存できない' do
    @comment.user = nil
    @comment.valid?
    expect(@comment.errors.full_messages).to include('User must exist')
  end

  it 'recipeが紐付いていないとコメントは保存できない' do
    @comment.recipe = nil
    @comment.valid?
    expect(@comment.errors.full_messages).to include('Recipe must exist')
  end
end
