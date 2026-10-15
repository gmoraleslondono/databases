import sqlite3

def connect():
    conn = sqlite3.connect("webshop.db")
    conn.execute("PRAGMA foreign_keys = ON")
    return conn

def list_products(conn):
    cursor = conn.execute("SELECT product_id, name, price, stock FROM products")
    for pid, name, price, stock in cursor.fetchall():
        print(f"{pid:>3}  {name:<20} {price:>8.2f} kr  ({stock} in stock)")

def search_customers(conn):
    city = input("City: ")
    cursor = conn.execute(
        "SELECT first_name, last_name FROM customers WHERE city = ?", (city,))
    rows = cursor.fetchall()
    if not rows:
        print("No customers found.")
    for first, last in rows:
        print(first, last)

def add_product(conn):
    name = input("Name: ")
    category = input("Category: ")
    price = float(input("Price: "))
    stock = int(input("Stock: "))
    conn.execute(
        "INSERT INTO products (name, category, price, stock) VALUES (?, ?, ?, ?)",
        (name, category, price, stock))
    conn.commit()
    print("Saved!")

def update_stock(conn):
    product = int(input("Product_id: "))
    new_stock = int(input("New stock: "))
    query = "UPDATE products SET stock = ? WHERE product_id = ?"
    conn.execute(query, (new_stock, product))
    conn.commit()
    print("Updated!")

def show_receipt(conn):
    order = int(input("Order Id: "))
    query = "SELECT p.name, o.quantity, o.quantity*o.unit_price AS subtotal FROM orders o JOIN products p ON o.product_id = p.product_id WHERE o.order_id = ?"
    cursor = conn.execute(query, (order,))
    rows = cursor.fetchall()
    if not rows:
        print("No order found.")
        return
    for name, quantity, subtotal in rows:
        print(name, quantity, subtotal)

def main():
    conn = connect()
    while True:
        print("\n1) List products  2) Search customers  3) Add product  0) Quit")
        choice = input("> ")
        if choice == "1":
            list_products(conn)
        elif choice == "2":
            search_customers(conn)
        elif choice == "3":
            add_product(conn)
        elif choice == "4":
            update_stock(conn)
        elif choice == "5":
            show_receipt(conn)
        elif choice == "0":
            break
    conn.close()

main()
