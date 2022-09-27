require 'todo_list'

RSpec.describe TodoList do
  context "when there are no todos" do
    it "returns an empty array" do
      todo_list = TodoList.new
      expect(todo_list.all).to eq []
    end
  end
end
