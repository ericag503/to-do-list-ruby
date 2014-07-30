require 'rspec'
require 'Task'
require 'List'

describe Task do
  it 'is initialized with a description' do
    test_task = Task.new('scrub the zebra')
    expect(test_task).to be_an_instance_of Task
  end

  it 'a new list is initialized with Home as @list_name' do
    test_list = List.new('Home')
    expect(test_list.list_name).to eq("Home")
  end


end
