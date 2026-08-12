#!/bin/bash

# ==============================
# Create Button
# ==============================

echo "🔘 Creating Button..."

mkdir -p src/components/Button

cat <<EOF > src/components/Button/Button.tsx
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
# Create Input
# ==============================

echo "⌨️ Creating Input..."

mkdir -p src/components/Input

cat <<EOF > src/components/Input/Input.tsx
import type { InputHTMLAttributes } from "react";

type InputProps = InputHTMLAttributes<HTMLInputElement> & {
  label?: string;
};

function Input({ label, id, ...props }: InputProps) {
  return (
    <div>
      {label && <label htmlFor={id}>{label}</label>}

      <input
        id={id}
        {...props}
      />
    </div>
  );
}

export default Input;
EOF

# ==============================
# Create Card
# ==============================

echo "🃏 Creating Card..."

mkdir -p src/components/Card

cat <<EOF > src/components/Card/Card.tsx
import type { ReactNode } from "react";

type CardProps = {
  children: ReactNode;
  title?: string;
};

function Card({ children, title }: CardProps) {
  return (
    <article>
      {title && <h2>{title}</h2>}

      {children}
    </article>
  );
}

export default Card;
EOF

# ==============================
# Create Loading
# ==============================

echo "⏳ Creating Loading..."

mkdir -p src/components/Loading

cat <<EOF > src/components/Loading/Loading.tsx
type LoadingProps = {
  message?: string;
};

function Loading({
  message = "Loading...",
}: LoadingProps) {
  return (
    <div role="status">
      <p>{message}</p>
    </div>
  );
}

export default Loading;
EOF

# ==============================
# Create ErrorMessage
# ==============================

echo "❌ Creating ErrorMessage..."

mkdir -p src/components/ErrorMessage

cat <<EOF > src/components/ErrorMessage/ErrorMessage.tsx
type ErrorMessageProps = {
  message?: string;
};

function ErrorMessage({
  message = "Something went wrong.",
}: ErrorMessageProps) {
  return (
    <div role="alert">
      <p>{message}</p>
    </div>
  );
}

export default ErrorMessage;
EOF

# ==============================
# Create Modal
# ==============================

echo "🪟 Creating Modal..."

mkdir -p src/components/Modal

cat <<EOF > src/components/Modal/Modal.tsx
import type { ReactNode } from "react";

type ModalProps = {
  isOpen: boolean;
  onClose: () => void;
  title?: string;
  children: ReactNode;
};

function Modal({
  isOpen,
  onClose,
  title,
  children,
}: ModalProps) {
  if (!isOpen) {
    return null;
  }

  return (
    <div role="dialog" aria-modal="true">
      <div>
        <button type="button" onClick={onClose}>
          X
        </button>

        {title && <h2>{title}</h2>}

        <div>
          {children}
        </div>
      </div>
    </div>
  );
}

export default Modal;
EOF

# ==============================
# Create ProtectedRoute
# ==============================

echo "🔐 Creating ProtectedRoute..."

mkdir -p src/components/ProtectedRoute

cat <<EOF > src/components/ProtectedRoute/ProtectedRoute.tsx
import { useEffect, useState } from "react";
import { Navigate, Outlet } from "react-router";

import { isLoggedIn } from "../../services/auth.service";
import Loading from "../Loading/Loading";

function ProtectedRoute() {
  const [authenticated, setAuthenticated] =
    useState<boolean | null>(null);

  useEffect(() => {
    async function checkAuthentication() {
      const loggedIn = await isLoggedIn();

      setAuthenticated(loggedIn);
    }

    checkAuthentication();
  }, []);

  if (authenticated === null) {
    return (
      <Loading message="Checking authentication..." />
    );
  }

  if (!authenticated) {
    return <Navigate to="/login" replace />;
  }

  return <Outlet />;
}

export default ProtectedRoute;
EOF