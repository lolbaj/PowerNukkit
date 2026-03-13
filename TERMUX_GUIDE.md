# 📱 Ultimate Termux Minecraft Server Guide

Welcome! This guide will help you set up a high-performance Minecraft: Bedrock Edition server on your Android device using this optimized PowerNukkit fork.

---

## 🛠️ Phase 1: Preparation

### 1. Install Termux
Do **NOT** download Termux from the Google Play Store (it is outdated).
*   Download the latest version from **[F-Droid](https://f-droid.org/en/packages/com.termux/)**.

### 2. Prevent Android from Killing the Server
Android likes to close background apps to save battery. You must disable this for the server to stay online:
1.  Open your phone **Settings**.
2.  Go to **Apps** -> **Termux**.
3.  Select **Battery** -> Set to **"Unrestricted"**.
4.  Also, open Termux and pull down the notification bar. If you see a "joypad" or "keyboard" icon, make sure it says **"Acquire Wakelock"** (if available) to keep the CPU awake.

---

## 🚀 Phase 2: Installation

Open Termux and copy-paste these commands one by one:

### 1. Update the System
```bash
pkg update && pkg upgrade -y
```
*If it asks you about "maintaining the current version," just press **Enter** for the default.*

### 2. Grant Storage Access
```bash
termux-setup-storage
```
*Click **"Allow"** on the Android popup.*

### 3. Install Dependencies
```bash
pkg install openjdk-21 git wget -y
```

### 4. Download the Server Files
```bash
git clone https://github.com/lolbaj/PowerNukkit.git
cd PowerNukkit
```

### 5. Download the optimized JAR
```bash
mkdir -p target
wget -O target/Nukkit-PM1E.jar https://github.com/PetteriM1/NukkitPetteriM1Edition/releases/latest/download/Nukkit-PM1E.jar
```

---

## 🎮 Phase 3: Launching

Start your server with the optimized script:
```bash
bash run-server.sh
```

### How to Join:
1.  Open Minecraft on your phone.
2.  Go to **Play** > **Servers** > **Add Server**.
3.  **Address:** `127.0.0.1`
4.  **Port:** `19132`

---

## ⚡ Performance Tips for Mobile
*   **RAM:** This setup uses **2GB of RAM**. Ensure your phone has at least 4GB total (6GB+ is ideal).
*   **Cooling:** Hosting a server makes your phone warm. Play in a cool area or remove your phone case for better airflow.
*   **Plugins:** We have pre-included **AutoClearLag** and **WorldManager**. Use `/clearlag` in game if you feel slow-down.

---

## 🌍 Letting Friends Join (Port Forwarding)
To let friends join who are **NOT** on your Wi-Fi, your phone's port needs to be public. Since most mobile networks block this, we recommend using:
*   **[Playit.gg](https://playit.gg/)**: A free tool that creates a public IP for your Termux server without complex router settings.
