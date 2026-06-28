#!/usr/bin/env python3
import http.server
import socketserver
import webbrowser
import os
import time

PORT = 8000
os.chdir(os.path.dirname(os.path.abspath(__file__)))

class MyHTTPRequestHandler(http.server.SimpleHTTPRequestHandler):
    def end_headers(self):
        self.send_header('Cache-Control', 'no-store, no-cache, must-revalidate, max-age=0')
        super().end_headers()

try:
    with socketserver.TCPServer(("", PORT), MyHTTPRequestHandler) as httpd:
        url = f"http://localhost:{PORT}/santa-biblia_html(1).html"
        print(f"✓ Servidor iniciado en {url}")
        print("Abriendo navegador...")
        webbrowser.open(url)
        print("Presiona CTRL+C para detener el servidor")
        httpd.serve_forever()
except KeyboardInterrupt:
    print("\n✓ Servidor detenido")
except OSError as e:
    print(f"Error: {e}")
    print("Es posible que el puerto 8000 esté en uso")
