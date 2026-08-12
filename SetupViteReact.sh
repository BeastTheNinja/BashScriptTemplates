#!/bin/bash

# ==============================
# React + Vite
# ==============================

echo "🚀 Creating React project..."

npm create vite@latest ./ -- --template react-compiler-ts --no-interactive


# ==============================
# Install dependencies
# ==============================

echo "📦 Installing dependencies..."

npm install react-router sass


# ==============================
# Create folders
# ==============================

echo "📁 Creating project structure..."

mkdir -p src/assets
mkdir -p src/components
mkdir -p src/hooks
mkdir -p src/layouts
mkdir -p src/pages
mkdir -p src/services
mkdir -p src/types
mkdir -p src/utils
mkdir -p src/router


# ==============================
# Cleanup Vite files
# ==============================

echo "🧹 Cleaning Vite starter files..."

cd src

rm -rf App.css
rm -f App.tsx

# Create App.tsx

cat <<EOF > App.tsx
function App() {
  return (
    <main>
      <h1>React Starter</h1>
    </main>
  );
}

export default App;
EOF

# Create index.css

cat <<EOF > index.css
:root {
  font-family: Arial, sans-serif;
}

* {
  box-sizing: border-box;
}

body {
  margin: 0;
}
EOF

echo "🧭 Creating router..."

cat <<EOF > router/router.tsx
import { createBrowserRouter } from "react-router";

import App from "../App";

export const router = createBrowserRouter([
  {
    path: "/",
    element: <App />,
  },
]);
EOF

echo "🔗 Connecting React Router..."

cat <<EOF > main.tsx
import { StrictMode } from "react";
import { createRoot } from "react-dom/client";
import { RouterProvider } from "react-router";
import { router } from "./router/router";
import "./index.css";

createRoot(document.getElementById("root")!).render(
  <StrictMode>
    <RouterProvider router={router} />
  </StrictMode>
);
EOF


echo "📐 Creating main layout..."

cat <<EOF > layouts/MainLayout.tsx
import { Outlet } from "react-router";

function MainLayout() {
  return (
    <>
      <header>
        <h1>Navbar</h1>
      </header>

      <main>
        <Outlet />
      </main>

      <footer>
        <p>Footer</p>
      </footer>
    </>
  );
}

export default MainLayout;
EOF

echo "🧭 Configuring routes..."

cat <<EOF > router/router.tsx
import { createBrowserRouter } from "react-router";

import App from "../App";
import MainLayout from "../layouts/MainLayout";

export const router = createBrowserRouter([
  {
    element: <MainLayout />,
    children: [
      {
        path: "/",
        element: <App />,
      },
    ],
  },
]);
EOF
 
# ==============================
# Finish
# ==============================

echo ""
echo "✅ Project setup complete!"
echo "🎉 Happy hacking!"