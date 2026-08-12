#!/bin/bash

# ==============================
# Create main layout
# ==============================

echo "📐 Creating main layout..."

cat <<EOF > src/layouts/MainLayout.tsx
import { Outlet } from "react-router";

function MainLayout() {
  return (
    <>
      <main>
        <Outlet />
      </main>
    </>
  );
}

export default MainLayout;
EOF

# ==============================
# Configure layout route
# ==============================

echo "🧭 Configuring layout route..."

cat <<EOF > src/router/router.tsx
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