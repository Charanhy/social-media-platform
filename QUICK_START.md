# Quick Start Guide - Social Media Platform

## 🚀 Part 1: Running the Application

### Prerequisites Check

1. **Verify Java Installation:**
   ```bash
   java -version
   ```
   You should see Java 17 or higher.

2. **Verify MySQL is Running:**
   ```bash
   # Windows - Open Command Prompt as Administrator
   net start | findstr MySQL
   
   # If MySQL is not running, start it:
   net start MySQL80
   ```

### Database Setup (One-time)

1. **Open Command Prompt and login to MySQL:**
   ```bash
   mysql -u root -p
   ```
   Enter your MySQL root password.

2. **Run these commands:**
   ```sql
   -- Create the user
   CREATE USER 'user'@'localhost' IDENTIFIED BY '#1#2#3%1%2%3';
   
   -- Create the database
   CREATE DATABASE socialmedia;
   
   -- Grant permissions
   GRANT ALL PRIVILEGES ON socialmedia.* TO 'user'@'localhost';
   FLUSH PRIVILEGES;
   
   -- Exit MySQL
   EXIT;
   ```

3. **Import the database schema:**
   ```bash
   # Navigate to project directory
   cd C:\Users\chara\Documents\SocialMediaPlatform
   
   # Import the SQL file
   mysql -u user -p socialmedia < database_setup.sql
   ```
   Enter password: `#1#2#3%1%2%3`

4. **Verify tables were created:**
   ```bash
   mysql -u user -p socialmedia -e "SHOW TABLES;"
   ```

### Running the Application

#### Method 1: Using Eclipse (Recommended)

1. Open Eclipse
2. Go to `File → Open Projects from File System`
3. Click `Directory` and select: `C:\Users\chara\Documents\SocialMediaPlatform`
4. Click `Finish`
5. Right-click on `Main.java` in the Package Explorer
6. Select `Run As → Java Application`

#### Method 2: Using Command Line

1. **Open Command Prompt:**
   ```bash
   cd C:\Users\chara\Documents\SocialMediaPlatform
   ```

2. **Compile the project:**
   ```bash
   javac -cp "lib/mysql-connector-j-9.3.0.jar;src" -d bin src/SocialMediaPlatform/Main.java src/Model/*.java src/View/*.java src/Controller/*.java
   ```

3. **Run the application:**
   ```bash
   java -cp "bin;lib/mysql-connector-j-9.3.0.jar" SocialMediaPlatform.Main
   ```

4. **If you see "✅ Connection successful!" in the console, you're ready to go!**

### Testing the Application

1. The Welcome screen should appear
2. Try logging in with sample data:
   - Email: `john.doe@example.com`
   - Password: `password123`
3. Or create a new account

---

## 🐙 Part 2: Pushing to GitHub

### Step 1: Initialize Git Repository

Open Command Prompt in your project directory:

```bash
cd C:\Users\chara\Documents\SocialMediaPlatform

# Initialize Git (if not already initialized)
git init
```

### Step 2: Add All Files

```bash
# Add all files (respects .gitignore)
git add .

# Check what will be committed
git status
```

### Step 3: Make First Commit

```bash
git commit -m "Initial commit: Social Media Platform application"
```

### Step 4: Create GitHub Repository

1. Go to https://github.com
2. Click the **"+"** icon in the top-right corner
3. Select **"New repository"**
4. Fill in the details:
   - **Repository name:** `social-media-platform` (or your preferred name)
   - **Description:** "Java Swing-based social media application with MySQL"
   - **Visibility:** Choose Public or Private
   - **DON'T** initialize with README (we already have one)
5. Click **"Create repository"**

### Step 5: Connect Local Repo to GitHub

GitHub will show you commands. Use these:

```bash
# Add the remote repository (replace YOUR_USERNAME with your GitHub username)
git remote add origin https://github.com/YOUR_USERNAME/social-media-platform.git

# Verify remote was added
git remote -v

# Push to GitHub (first time)
git branch -M main
git push -u origin main
```

### Step 6: Enter GitHub Credentials

When prompted:
- **Username:** Your GitHub username
- **Password:** Use a Personal Access Token (not your password)

#### Creating a Personal Access Token:
1. Go to GitHub Settings → Developer settings → Personal access tokens → Tokens (classic)
2. Click "Generate new token"
3. Give it a name and select scopes: `repo` (full control)
4. Click "Generate token"
5. **Copy the token immediately** (you won't see it again)
6. Use this token as your password when pushing

### Alternative: Using GitHub Desktop

1. Download GitHub Desktop: https://desktop.github.com/
2. Open GitHub Desktop
3. Go to `File → Add Local Repository`
4. Select your project folder: `C:\Users\chara\Documents\SocialMediaPlatform`
5. Click "Publish repository"
6. Choose name, description, and visibility
7. Click "Publish repository"

### Step 7: Verify Your Repository

1. Go to `https://github.com/YOUR_USERNAME/social-media-platform`
2. You should see all your files including:
   - README.md
   - database_setup.sql
   - src folder
   - lib folder with MySQL connector

### Future Updates

After making changes:

```bash
# Check what changed
git status

# Add all changes
git add .

# Commit with a message
git commit -m "Description of what you changed"

# Push to GitHub
git push
```

---

## 📋 Common Issues & Solutions

### Issue 1: "Access denied for user"
**Solution:** Check MySQL credentials in `Database.java` and ensure the user exists.

### Issue 2: "ClassNotFoundException: com.mysql.cj.jdbc.Driver"
**Solution:** Verify `mysql-connector-j-9.3.0.jar` exists in the `lib/` folder.

### Issue 3: "Table doesn't exist"
**Solution:** Run the `database_setup.sql` script again.

### Issue 4: Git push asks for password repeatedly
**Solution:** Use a Personal Access Token instead of password, or set up SSH keys.

### Issue 5: "Cannot find module"
**Solution:** In Eclipse, right-click project → Properties → Java Build Path → Libraries → Add JARs → Select MySQL connector

---

## 🎯 Next Steps

1. ✅ Run the application and explore features
2. ✅ Push to GitHub
3. 📝 Customize the application (add features, improve UI)
4. 📢 Share your repository!

---

## 📞 Need Help?

- Check the main README.md for detailed documentation
- Review error messages in the console
- Ensure all prerequisites are installed and running
- Check that database tables are created properly

---

**Happy Coding! 🚀**
