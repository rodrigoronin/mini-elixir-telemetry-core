# 🚀 Mini Telemetry Core (Elixir + Phoenix)

A simplified real-time telemetry system inspired by high-concurrency architectures.

This project is a study-driven implementation focused on learning backend engineering concepts using Elixir, Phoenix, and OTP.

---

## 🧠 Overview

The goal of this project is to simulate a system that:

- Receives events from multiple "sensors"
- Processes data concurrently
- Stores real-time state in memory
- Persists data to a local database
- Displays updates in real-time via web interface

This architecture is inspired by real-world industrial systems that require high throughput and low latency.

---

## 🧰 Tech Stack

- **Elixir 1.19**
- **Erlang/OTP 28**
- **Phoenix (LiveView)**
- **Ecto + SQLite**
- **ETS (in-memory storage)**
- **GenServer / OTP**

---

## 🏗️ Architecture (Simplified)

```
Events → GenServer → ETS (real-time state)
                     ↓
                 SQLite (persistence)
                     ↓
                 Phoenix LiveView (UI)
```

---

## 🎯 Learning Goals

This project focuses on:

- Understanding the Actor Model (Erlang/OTP)
- Working with GenServer and process supervision
- Handling concurrent data ingestion
- Using ETS for high-performance in-memory storage
- Building reactive UIs with Phoenix LiveView
- Designing systems with separation between read/write flows

---

## ⚙️ Getting Started

### 1. Install dependencies

```bash
mix deps.get
```

### 2. Setup database

```bash
mix setup
```

### 3. Run the server

```bash
mix phx.server
```

Or using IEx:

```bash
iex -S mix phx.server
```

---

## 🌐 Access the app

Open:

```
http://localhost:4000
```

---

## 🧪 Development Notes

- SQLite is used for local persistence
- ETS will be used as the primary real-time data layer
- LiveView will handle UI updates without heavy frontend frameworks

---

## 📌 Status

🚧 In progress — built as part of a backend engineering learning journey.

---

## 💡 Inspiration

This project is inspired by real-world systems dealing with:

- IoT telemetry
- Edge computing
- High-throughput event processing
- Fault-tolerant architectures

---

## 👨‍💻 Author

Developed as part of a continuous learning path toward fullstack/backend engineering.
