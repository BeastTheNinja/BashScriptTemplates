#!/bin/bash

# ==============================
# Create Hooks
# ==============================

echo "🪝 Creating custom React hooks..."

# ==============================
# useForm
# ==============================

echo "📝 Creating useForm..."

cat <<EOF > src/hooks/useForm.ts
import { useState, type ChangeEvent } from "react";

type ValidationErrors<T> = Partial<Record<keyof T, string>>;

type UseFormOptions<T> = {
  initialValues: T;
  validate?: (values: T) => ValidationErrors<T>;
};

function useForm<T>({
  initialValues,
  validate,
}: UseFormOptions<T>) {
  const [values, setValues] = useState<T>(initialValues);
  const [errors, setErrors] = useState<ValidationErrors<T>>({});

  function handleChange(event: ChangeEvent<HTMLInputElement>) {
    const { name, value } = event.target;

    setValues((currentValues) => ({
      ...currentValues,
      [name]: value,
    }));
  }

  function validateForm() {
    if (!validate) {
      return true;
    }

    const validationErrors = validate(values);

    setErrors(validationErrors);

    return Object.keys(validationErrors).length === 0;
  }

  function resetForm() {
    setValues(initialValues);
    setErrors({});
  }

  return {
    values,
    errors,
    handleChange,
    validateForm,
    resetForm,
  };
}

export default useForm;
EOF

# ==============================
# useFetch
# ==============================

echo "🌐 Creating useFetch..."

cat <<EOF > src/hooks/useFetch.ts
import { useCallback, useEffect, useState } from "react";

import api from "../services/api";

function useFetch<T>(endpoint: string) {
  const [data, setData] = useState<T | null>(null);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState<string | null>(null);

  const fetchData = useCallback(async () => {
    setLoading(true);
    setError(null);

    try {
      const result = await api<T>(endpoint);

      setData(result);
    } catch {
      setError("Could not fetch data.");
    } finally {
      setLoading(false);
    }
  }, [endpoint]);

  useEffect(() => {
    fetchData();
  }, [fetchData]);

  return {
    data,
    loading,
    error,
    refetch: fetchData,
  };
}

export default useFetch;
EOF

# ==============================
# useSearch
# ==============================

echo "🔎 Creating useSearch..."

cat <<EOF > src/hooks/useSearch.ts
import { useMemo, useState } from "react";

function useSearch<T>(
  items: T[],
  searchFields: (keyof T)[]
) {
  const [search, setSearch] = useState("");

  const filteredItems = useMemo(() => {
    if (!search.trim()) {
      return items;
    }

    const searchTerm = search.toLowerCase();

    return items.filter((item) =>
      searchFields.some((field) =>
        String(item[field])
          .toLowerCase()
          .includes(searchTerm)
      )
    );
  }, [items, search, searchFields]);

  return {
    search,
    setSearch,
    filteredItems,
  };
}

export default useSearch;
EOF

# ==============================
# usePagination
# ==============================

echo "📄 Creating usePagination..."

cat <<EOF > src/hooks/usePagination.ts
import { useMemo, useState } from "react";

function usePagination<T>(
  items: T[],
  itemsPerPage = 10
) {
  const [currentPage, setCurrentPage] = useState(1);

  const totalPages = Math.ceil(
    items.length / itemsPerPage
  );

  const paginatedItems = useMemo(() => {
    const startIndex =
      (currentPage - 1) * itemsPerPage;

    const endIndex =
      startIndex + itemsPerPage;

    return items.slice(startIndex, endIndex);
  }, [items, currentPage, itemsPerPage]);

  function nextPage() {
    setCurrentPage((page) =>
      Math.min(page + 1, totalPages)
    );
  }

  function previousPage() {
    setCurrentPage((page) =>
      Math.max(page - 1, 1)
    );
  }

  function goToPage(page: number) {
    setCurrentPage(
      Math.min(Math.max(page, 1), totalPages)
    );
  }

  return {
    currentPage,
    totalPages,
    paginatedItems,
    nextPage,
    previousPage,
    goToPage,
  };
}

export default usePagination;
EOF

# ==============================
# useSort
# ==============================

echo "↕️ Creating useSort..."

cat <<EOF > src/hooks/useSort.ts
import { useMemo, useState } from "react";

type SortDirection = "asc" | "desc";

function useSort<T>(
  items: T[],
  defaultKey: keyof T
) {
  const [sortKey, setSortKey] =
    useState<keyof T>(defaultKey);

  const [direction, setDirection] =
    useState<SortDirection>("asc");

  const sortedItems = useMemo(() => {
    return [...items].sort((a, b) => {
      const valueA = String(a[sortKey]).toLowerCase();
      const valueB = String(b[sortKey]).toLowerCase();

      if (valueA < valueB) {
        return direction === "asc" ? -1 : 1;
      }

      if (valueA > valueB) {
        return direction === "asc" ? 1 : -1;
      }

      return 0;
    });
  }, [items, sortKey, direction]);

  function sortBy(key: keyof T) {
    if (sortKey === key) {
      setDirection((currentDirection) =>
        currentDirection === "asc"
          ? "desc"
          : "asc"
      );

      return;
    }

    setSortKey(key);
    setDirection("asc");
  }

  return {
    sortedItems,
    sortKey,
    direction,
    sortBy,
  };
}

export default useSort;
EOF

echo "✅ Custom hooks created!"