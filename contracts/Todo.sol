// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract Todo {
    struct TodoItem {
        string name;
    }
    event TodoAdded(
        string name
    );
    event TodoRemoved(
        string name
    );

    TodoItem[] public todos;

    function addTodo(string memory _name) public {
        todos.push(TodoItem(_name));
        emit TodoAdded(_name);
    }

    function getTodos() public view returns (TodoItem[] memory) {
        return todos;
    }

    function getTodosCount() public view returns (uint256) {
        return todos.length;
    }

    // remove todo by index
    function removeTodoByIndex(uint256 index) public {
        require(index < todos.length, "Todo does not exist");
        TodoItem memory todo = todos[index];
        delete todos[index];
        emit TodoRemoved(todo.name);
    }
}



