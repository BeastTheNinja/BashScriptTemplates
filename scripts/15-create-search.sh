#!/bin/bash

# ==============================
# Add Search to Users
# ==============================

echo "🔎 Adding search to Users..."

cat <<'EOF' > src/pages/Users/Users.tsx
import useFetch from "../../hooks/useFetch";
import useSearch from "../../hooks/useSearch";

import type { User } from "../../types/user";

import Loading from "../../components/Loading/Loading";
import ErrorMessage from "../../components/ErrorMessage/ErrorMessage";
import Card from "../../components/Card/Card";
import Input from "../../components/Input/Input";
import Button from "../../components/Button/Button";

function Users() {
  const {
    data: users,
    loading,
    error,
    refetch,
  } = useFetch<User[]>("/users");

  const {
    search,
    setSearch,
    filteredItems,
  } = useSearch(
    users ?? [],
    ["firstName", "lastName", "email"]
  );

  if (loading) {
    return <Loading message="Loading users..." />;
  }

  if (error) {
    return <ErrorMessage message={error} />;
  }

  return (
    <section>
      <h1>Users</h1>

      <Input
        id="user-search"
        name="search"
        label="Search"
        type="search"
        value={search}
        onChange={(event) => setSearch(event.target.value)}
        placeholder="Search users..."
      />

      <Button onClick={refetch}>
        Refresh
      </Button>

      {filteredItems.map((user) => (
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

echo "✅ Search added to Users!"