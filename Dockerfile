FROM python:3.11-slim

ENV DEBIAN_FRONTEND=noninteractive

# Install system dependencies
RUN apt update && \
    apt install -y libpython3-dev libdbus-1-dev bluetooth bluez dbus libbluetooth-dev build-essential libglib2.0-dev git && \
    pip install --upgrade pip && \
    pip install \
      nxbt \
      "Flask<2.3" \
      "itsdangerous<2.1" \
      "Werkzeug<2.1" \
      eventlet==0.33.3 \
      dnspython==2.2.1 && \
    pip install git+https://github.com/pybluez/pybluez.git

# Optional: expose port if using webapp mode
EXPOSE 8000

# Start NXBT web UI
CMD ["nxbt", "webapp"]
