#!/bin/bash

# ==============================
# Create Navbar
# ==============================

echo "🧭 Creating Navbar..."

mkdir -p src/components/Navbar

cat <<EOF > src/components/Navbar/Navbar.tsx
function Navbar() {
  return (
    <nav>
      <h1>React Starter</h1>
    </nav>
  );
}

export default Navbar;
EOF

# ==============================
# Create Footer
# ==============================

echo "🦶 Creating Footer..."

mkdir -p src/components/Footer

cat <<EOF > src/components/Footer/Footer.tsx
function Footer() {
  return (
    <footer>
      <p>React Starter</p>
    </footer>
  );
}

export default Footer;
EOF

# ==============================
# Connect Navbar and Footer
# ==============================

echo "🔗 Connecting Navbar and Footer..."

cat <<EOF > src/layouts/MainLayout.tsx
import { Outlet } from "react-router";

import Navbar from "../components/Navbar/Navbar";
import Footer from "../components/Footer/Footer";

function MainLayout() {
  return (
    <>
      <Navbar />

      <main>
        <Outlet />
      </main>

      <Footer />
    </>
  );
}

export default MainLayout;
EOF