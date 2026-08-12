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

echo "🧭 Creating Navbar..."

mkdir -p components/Navbar

cat <<EOF > components/Navbar/Navbar.tsx
function Navbar(){
  return(
    <nav>
      <h1>React Starter</h1>
    </nav>
  );
}
export default Navbar;
EOF 

echo "🦶 Creating Footer..."

mkdir -p components/Footer

cat <<EOF > components/Footer/Footer.tsx
function Footer(){
  return(
    <footer>
      <p>React Starter</p>
    </footer>
  );
}
export default Footer;
EOF

echo "🔗 Connecting Navbar and Footer..."

cat <<EOF > layouts/MainLayout.tsx
import { Outlet } from "react-router";
import Navbar from "../components/Navbar/Navbar.tsx";
import Footer from "../components/Footer/Footer.tsx";

function MainLayout() {
  return (
    <>
      <Navbar />

      <main>
        <Outlet />
      </main>

      <Footer />
    </>
  );
}
export default MainLayout;
EOF

echo "🔘 Creating Button..."

mkdir -p components/Button

cat <<EOF > components/Button/Button.tsx
import type { ButtonHTMLAttributes, ReactNode } from "react";

type ButtonProps = ButtonHTMLAttributes<HTMLButtonElement> & {
  children: ReactNode;
  variant?: "primary" | "secondary" | "danger";
};

function Button({
  children,
  variant = "primary",
  ...props
}: ButtonProps) {
  return (
    <button
      type="button"
      data-variant={variant}
      {...props}
    >
      {children}
    </button>
  );
}

export default Button;
EOF



# ==============================
# Finish
# ==============================

echo ""
echo "✅ Project setup complete!"
echo "🎉 Happy hacking!"