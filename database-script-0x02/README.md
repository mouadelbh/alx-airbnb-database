# Database Seed Script – ALX Airbnb Clone

## 🎯 Objective
Populate the Airbnb database with realistic sample data for testing and development.

## 📜 File: `seed.sql`
This script inserts:
- 2 hosts and 2 guests
- 2 properties
- 2 bookings (one confirmed, one pending)
- 1 payment for a confirmed booking
- 1 review
- 1 user-to-user message

## ✅ Execution
To run this script, use:

```bash
sqlite3 airbnb_clone.db < seed.sql
