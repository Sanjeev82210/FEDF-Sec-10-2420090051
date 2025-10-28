import React from "react";
import ReactDOM from "react-dom/client";
import { BrowserRouter } from "react-router-dom";
import App from "./App";
ReactDOM.createRoot(document.getElementById("root")).render(
<BrowserRouter>
<App />
</BrowserRouter>
);
App.jsx
import React from "react";
import { Routes, Route } from "react-router-dom";
import BookList from "./pages/BookList";
import BookDetail from "./components/BookDetail";
const App = () => {
return (
<div style={{ padding: "20px", fontFamily: "Arial" }}>
<h1> Book Explorer</h1>
<Routes>
<Route path="/" element={<BookList />} />
<Route path="/book/:id" element={<BookDetail />} />
</Routes>
</div>
);
};
export default App;