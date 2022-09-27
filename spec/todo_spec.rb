require 'todo'

RSpec.describe Todo do
  context "when task is called" do
    it "returns the task" do
      todo = Todo.new("eat")
      expect(todo.task).to eq "eat"
    end
  end
end
