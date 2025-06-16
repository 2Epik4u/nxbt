# need to run an entire ubuntu os just for this, so it might be a little too big

FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

# Install systemd + dependencies
RUN apt-get update && \
    apt-get install -y libpython3-dev libdbus-1-dev systemd libglib2.0-dev systemd-sysv bluetooth bluez dbus python3 python3-pip git \
    libbluetooth-dev build-essential && \
    pip install --upgrade pip && \
    pip install \
      nxbt \
      "Flask<2.3" \
      "itsdangerous<2.1" \
      "Werkzeug<2.1" \
      eventlet==0.33.3 \
      dnspython==2.2.1 && \
    pip install git+https://github.com/pybluez/pybluez.git && \
    apt clean && rm -rf /var/lib/apt/lists/*

VOLUME [ "/sys/fs/cgroup" ]
STOPSIGNAL SIGRTMIN+3

# Optional: expose port if using webapp mode
EXPOSE 8000

# Start NXBT web UI
CMD ["nxbt", "webapp"]
