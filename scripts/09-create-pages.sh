#!/bin/bash

# ==============================
# Create Home page
# ==============================

echo "🏠 Creating Home page..."

mkdir -p src/pages/Home

cat <<EOF > src/pages/Home/Home.tsx
function Home() {
  return (
    <section>
      <h1>Home</h1>
      <p>Welcome to your React application.</p>
    </section>
  );
}

export default Home;
EOF

# ==============================
# Create Login page
# ==============================

echo "🔑 Creating Login page..."

mkdir -p src/pages/Login

cat <<EOF > src/pages/Login/Login.tsx
function Login() {
  return (
    <section>
      <h1>Login</h1>
    </section>
  );
}

export default Login;
EOF

# ==============================
# Create Register page
# ==============================

echo "📝 Creating Register page..."

mkdir -p src/pages/Register

cat <<EOF > src/pages/Register/Register.tsx
function Register() {
  return (
    <section>
      <h1>Register</h1>
    </section>
  );
}

export default Register;
EOF

# ==============================
# Create Dashboard page
# ==============================

echo "📊 Creating Dashboard page..."

mkdir -p src/pages/Dashboard

cat <<EOF > src/pages/Dashboard/Dashboard.tsx
function Dashboard() {
  return (
    <section>
      <h1>Dashboard</h1>
      <p>You are logged in.</p>
    </section>
  );
}

export default Dashboard;
EOF

# ==============================
# Create Users page
# ==============================

echo "👥 Creating Users page..."

mkdir -p src/pages/Users

cat <<EOF > src/pages/Users/Users.tsx
function Users() {
  return (
    <section>
      <h1>Users</h1>
      <p>Users will be loaded here.</p>
    </section>
  );
}

export default Users;
EOF

# ==============================
# Create NotFound page
# ==============================

echo "🔎 Creating NotFound page..."

mkdir -p src/pages/NotFound

cat <<EOF > src/pages/NotFound/NotFound.tsx
import { Link } from "react-router";

function NotFound() {
  return (
    <main>
      <h1>404</h1>

      <h2>Page not found</h2>

      <p>
        The page you are looking for does not exist.
      </p>

      <Link to="/">
        Go back home
      </Link>
    </main>
  );
}

export default NotFound;
EOF

# ==============================
# Configure application routes
# ==============================

echo "🧭 Configuring application routes..."

cat <<EOF > src/router/router.tsx
import { createBrowserRouter } from "react-router";

import MainLayout from "../layouts/MainLayout";

import Home from "../pages/Home/Home";
import Login from "../pages/Login/Login";
import Register from "../pages/Register/Register";
import Dashboard from "../pages/Dashboard/Dashboard";
import Users from "../pages/Users/Users";
import NotFound from "../pages/NotFound/NotFound";

import ProtectedRoute from "../components/ProtectedRoute/ProtectedRoute";

export const router = createBrowserRouter([
  {
    element: <MainLayout />,
    children: [
      {
        path: "/",
        element: <Home />,
      },
      {
        path: "/login",
        element: <Login />,
      },
      {
        path: "/register",
        element: <Register />,
      },
      {
        element: <ProtectedRoute />,
        children: [
          {
            path: "/dashboard",
            element: <Dashboard />,
          },
          {
            path: "/users",
            element: <Users />,
          },
        ],
      },
      {
        path: "*",
        element: <NotFound />,
      },
    ],
  },
]);
EOF