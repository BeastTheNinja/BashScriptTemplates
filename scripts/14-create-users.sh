#!/bin/bash

# ==============================
# Users Page
# ==============================

echo "👥 Creating Users page..."

mkdir -p src/pages/Users

cat <<'EOF' > src/pages/Users/Users.tsx
import useFetch from "../../hooks/useFetch";

import type { User } from "../../types/user";

import Loading from "../../components/Loading/Loading";
import ErrorMessage from "../../components/ErrorMessage/ErrorMessage";
import Card from "../../components/Card/Card";

function Users() {
  const {
    data: users,
    loading,
    error,
  } = useFetch<User[]>("/users");

  if (loading) {
    return <Loading message="Loading users..." />;
  }

  if (error) {
    return <ErrorMessage message={error} />;
  }

  return (
    <section>
      <h1>Users</h1>

      {users?.map((user) => (
        <Card
          key={user.id}
          title={`${user.firstName} ${user.lastName}`}
        >
          <p>{user.email}</p>
          <p>Role: {user.role}</p>
        </Card>
      ))}
    </section>
  );
}

export default Users;
EOF

# ==============================
# Add Users Route
# ==============================

echo "🧭 Adding Users route..."

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

echo "✅ Users page created!"