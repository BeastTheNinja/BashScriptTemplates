#!/bin/bash

# ==============================
# Create User type
# ==============================

echo "👤 Creating User type..."

cat <<EOF > src/types/user.ts
export type User = {
  id: number;
  email: string;
  firstName: string;
  lastName: string;
  role: "USER" | "ADMIN";
};
EOF

# ==============================
# Create authentication types
# ==============================

echo "🔐 Creating authentication types..."

cat <<EOF > src/types/auth.ts
import type { User } from "./user";

export type LoginCredentials = {
  email: string;
  password: string;
};

export type RegisterCredentials = {
  firstName: string;
  lastName: string;
  email: string;
  password: string;
};

export type AuthResponse = {
  user: User;
};
EOF

# ==============================
# Create authentication service
# ==============================

echo "🔐 Creating authentication service..."

cat <<EOF > src/services/auth.service.ts
import api from "./api";

import type {
  AuthResponse,
  LoginCredentials,
  RegisterCredentials,
} from "../types/auth";

export function login(credentials: LoginCredentials) {
  return api<AuthResponse>("/auth/login", {
    method: "POST",
    body: JSON.stringify(credentials),
  });
}

export function register(
  credentials: RegisterCredentials
) {
  return api<AuthResponse>("/auth/register", {
    method: "POST",
    body: JSON.stringify(credentials),
  });
}

export function logout() {
  return api<void>("/auth/logout", {
    method: "POST",
  });
}

export async function isLoggedIn() {
  try {
    await api("/auth/me");

    return true;
  } catch {
    return false;
  }
}
EOF

# ==============================
# Create Login page
# ==============================

echo "🔑 Creating Login page..."

cat <<EOF > src/pages/Login/Login.tsx
import {
  FormEvent,
  useState,
} from "react";

import { useNavigate } from "react-router";

import Button from "../../components/Button/Button";
import Input from "../../components/Input/Input";
import Loading from "../../components/Loading/Loading";
import ErrorMessage from "../../components/ErrorMessage/ErrorMessage";

import { login } from "../../services/auth.service";

function Login() {
  const navigate = useNavigate();

  const [email, setEmail] = useState("");
  const [password, setPassword] = useState("");

  const [loading, setLoading] = useState(false);
  const [error, setError] = useState("");

  async function handleSubmit(
    event: FormEvent<HTMLFormElement>
  ) {
    event.preventDefault();

    setLoading(true);
    setError("");

    try {
      await login({
        email,
        password,
      });

      navigate("/dashboard");
    } catch {
      setError("Invalid email or password.");
    } finally {
      setLoading(false);
    }
  }

  if (loading) {
    return (
      <Loading message="Logging in..." />
    );
  }

  return (
    <section>
      <h1>Login</h1>

      {error && (
        <ErrorMessage message={error} />
      )}

      <form onSubmit={handleSubmit}>
        <Input
          id="email"
          name="email"
          label="Email"
          type="email"
          value={email}
          onChange={(event) =>
            setEmail(event.target.value)
          }
          required
        />

        <Input
          id="password"
          name="password"
          label="Password"
          type="password"
          value={password}
          onChange={(event) =>
            setPassword(event.target.value)
          }
          required
        />

        <Button type="submit">
          Login
        </Button>
      </form>
    </section>
  );
}

export default Login;
EOF

# ==============================
# Create Register page
# ==============================

echo "📝 Creating Register page..."

cat <<EOF > src/pages/Register/Register.tsx
import {
  FormEvent,
  useState,
} from "react";

import { useNavigate } from "react-router";

import Button from "../../components/Button/Button";
import Input from "../../components/Input/Input";
import Loading from "../../components/Loading/Loading";
import ErrorMessage from "../../components/ErrorMessage/ErrorMessage";

import { register } from "../../services/auth.service";

function Register() {
  const navigate = useNavigate();

  const [firstName, setFirstName] = useState("");
  const [lastName, setLastName] = useState("");
  const [email, setEmail] = useState("");
  const [password, setPassword] = useState("");

  const [loading, setLoading] = useState(false);
  const [error, setError] = useState("");

  async function handleSubmit(
    event: FormEvent<HTMLFormElement>
  ) {
    event.preventDefault();

    setLoading(true);
    setError("");

    try {
      await register({
        firstName,
        lastName,
        email,
        password,
      });

      navigate("/dashboard");
    } catch {
      setError("Could not create account.");
    } finally {
      setLoading(false);
    }
  }

  if (loading) {
    return (
      <Loading message="Creating account..." />
    );
  }

  return (
    <section>
      <h1>Register</h1>

      {error && (
        <ErrorMessage message={error} />
      )}

      <form onSubmit={handleSubmit}>
        <Input
          id="firstName"
          name="firstName"
          label="First name"
          type="text"
          value={firstName}
          onChange={(event) =>
            setFirstName(event.target.value)
          }
          required
        />

        <Input
          id="lastName"
          name="lastName"
          label="Last name"
          type="text"
          value={lastName}
          onChange={(event) =>
            setLastName(event.target.value)
          }
          required
        />

        <Input
          id="email"
          name="email"
          label="Email"
          type="email"
          value={email}
          onChange={(event) =>
            setEmail(event.target.value)
          }
          required
        />

        <Input
          id="password"
          name="password"
          label="Password"
          type="password"
          value={password}
          onChange={(event) =>
            setPassword(event.target.value)
          }
          required
        />

        <Button type="submit">
          Create account
        </Button>
      </form>
    </section>
  );
}

export default Register;
EOF

# ==============================
# Add logout to Navbar
# ==============================

echo "🚪 Adding logout to Navbar..."

cat <<EOF > src/components/Navbar/Navbar.tsx
import { useNavigate } from "react-router";

import Button from "../Button/Button";

import { logout } from "../../services/auth.service";

function Navbar() {
  const navigate = useNavigate();

  async function handleLogout() {
    try {
      await logout();

      navigate("/login");
    } catch {
      console.error("Logout failed");
    }
  }

  return (
    <nav>
      <h1>React Starter</h1>

      <div>
        <Button onClick={handleLogout}>
          Logout
        </Button>
      </div>
    </nav>
  );
}

export default Navbar;
EOF