#!/bin/bash

# ==============================
# Create React Router
# ==============================

echo "🧭 Creating router..."

cat <<EOF > src/router/router.tsx
import { createBrowserRouter } from "react-router";

import App from "../App";

export const router = createBrowserRouter([
  {
    path: "/",
    element: <App />,
  },
]);
EOF

# ==============================
# Connect React Router
# ==============================

echo "🔗 Connecting React Router..."

cat <<EOF > src/main.tsx
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