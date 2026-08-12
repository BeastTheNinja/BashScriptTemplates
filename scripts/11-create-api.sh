#!/bin/bash

# ==============================
# API Service
# ==============================

echo "🌐 Creating API service..."

cat <<'EOF' > src/services/api.ts
const API_URL = import.meta.env.VITE_API_URL;

async function api<T>(
  endpoint: string,
  options?: RequestInit
): Promise<T> {
  const response = await fetch(`${API_URL}${endpoint}`, {
    ...options,

    credentials: "include",

    headers: {
      "Content-Type": "application/json",
      ...options?.headers,
    },
  });

  if (!response.ok) {
    throw new Error(`API Error: ${response.status}`);
  }

  return response.json();
}

export default api;
EOF

# ==============================
# Environment
# ==============================

echo "⚙️ Creating environment file..."

cat <<EOF > .env
VITE_API_URL=http://localhost:4000
EOF

echo "✅ API service created!"