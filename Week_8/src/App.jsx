import React, { useState, useEffect } from "react";
import TaskForm from "./TaskFrom";
import TaskList from "./TaskList";
import "./App.css";

function App() {
    const [tasks, setTasks] = useState([]);
    const [nextId, setNextId] = useState(1);

    // Load tasks from localStorage on mount
    useEffect(() => {
        const savedTasks = localStorage.getItem('tasks');
        if (savedTasks) {
            const parsedTasks = JSON.parse(savedTasks);
            setTasks(parsedTasks);
            if (parsedTasks.length > 0) {
                setNextId(Math.max(...parsedTasks.map(t => t.id)) + 1);
            }
        }
    }, []);

    // Save tasks to localStorage whenever they change
    useEffect(() => {
        if (tasks.length > 0) {
            localStorage.setItem('tasks', JSON.stringify(tasks));
        }
    }, [tasks]);

    const handleAddTask = (title) => {
        const newTask = {
            id: nextId,
            title,
            completed: false
        };
        setTasks([...tasks, newTask]);
        setNextId(nextId + 1);
    };

    const handleDeleteTask = (id) => {
        setTasks(tasks.filter((task) => task.id !== id));
    };

    const toggleTaskCompletion = (id) => {
        setTasks(tasks.map((t) =>
            t.id === id ? { ...t, completed: !t.completed } : t
        ));
    };
    return (
        <div className="App">
            <h1> To-Do List</h1>
            <TaskForm onAddTask={handleAddTask} />
            {tasks.length === 0 ? (
                <p>No tasks yet! Add your first one below </p>
            ) : (
                <TaskList
                    tasks={tasks}
                    onDelete={handleDeleteTask}
                    onToggle={toggleTaskCompletion}
                />
            )}
        </div>
    );
}
export default App;