#!/bin/bash

# ==============================
# Error Boundary
# ==============================

echo "🚨 Creating ErrorBoundary..."

mkdir -p src/components/ErrorBoundary

cat <<EOF > src/components/ErrorBoundary/ErrorBoundary.tsx
import {
  Component,
  type ErrorInfo,
  type ReactNode,
} from "react";

type ErrorBoundaryProps = {
  children: ReactNode;
};

type ErrorBoundaryState = {
  hasError: boolean;
};

class ErrorBoundary extends Component<
  ErrorBoundaryProps,
  ErrorBoundaryState
> {
  state: ErrorBoundaryState = {
    hasError: false,
  };

  static getDerivedStateFromError(): ErrorBoundaryState {
    return {
      hasError: true,
    };
  }

  componentDidCatch(error: Error, errorInfo: ErrorInfo) {
    console.error("React Error:", error);
    console.error("Error Info:", errorInfo);
  }

  render() {
    if (this.state.hasError) {
      return (
        <main>
          <h1>Something went wrong</h1>
          <p>Please try refreshing the page.</p>

          <button onClick={() => window.location.reload()}>
            Reload
          </button>
        </main>
      );
    }

    return this.props.children;
  }
}

export default ErrorBoundary;
EOF

# ==============================
# Connect ErrorBoundary
# ==============================

echo "🛡️ Connecting ErrorBoundary..."

cat <<EOF > src/main.tsx
import { StrictMode } from "react";
import { createRoot } from "react-dom/client";
import { RouterProvider } from "react-router";

import { router } from "./router/router";
import ErrorBoundary from "./components/ErrorBoundary/ErrorBoundary";

import "./index.css";

createRoot(document.getElementById("root")!).render(
  <StrictMode>
    <ErrorBoundary>
      <RouterProvider router={router} />
    </ErrorBoundary>
  </StrictMode>
);
EOF

# ==============================
# Not Found Page
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

echo "✅ Error handling setup complete!"