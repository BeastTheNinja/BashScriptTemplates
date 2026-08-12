#!/bin/bash

# ==============================
# Cleanup Vite starter files
# ==============================

echo "🧹 Cleaning Vite starter files..."

cd src || exit 1

rm -rf App.css
rm -f App.tsx

# ==============================
# Create App.tsx
# ==============================

echo "📄 Creating App.tsx..."

cat <<EOF > App.tsx
function App() {
  return (
    <main>
      <h1>React Starter</h1>
    </main>
  );
}

export default App;
EOF

# ==============================
# Create index.css
# ==============================

echo "🎨 Creating index.css..."

cat <<EOF > index.css
:root {
  font-family: Arial, sans-serif;
}

* {
  box-sizing: border-box;
}

body {
  margin: 0;
}
EOF

cd ..