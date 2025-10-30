# Social Media Platform 🚀

A modern, colorful Java-based social media application built with Swing GUI and MySQL database. This application allows users to create accounts, post content, comment, like posts, and manage friends.

> **✨ With enhanced UI featuring vibrant colors and smooth interactions!**

## 🎮 Quick Demo

**Login credentials to see the platform in action:**
- **Username:** `XXXX`
- **Password:** `XXXXX`

This account comes pre-populated with:
- ✅ 6 engaging posts
- ✅ 10 friends already connected
- ✅ Multiple likes and comments
- ✅ Active timeline with community content

## Features

- 👤 User authentication (Login/Register)
- 📝 Create and view posts
- 💬 Comment on posts
- ❤️ Like/Dislike posts
- 👥 Add and remove friends
- 🔄 Generate personalized timeline
- 🔐 Change password functionality
- 👁️ View user profiles and activities

## Technologies Used

- **Language:** Java 17
- **GUI Framework:** Java Swing
- **Database:** MySQL
- **JDBC Driver:** MySQL Connector/J 9.3.0

## Prerequisites

Before running this application, make sure you have:

1. **Java JDK 17 or higher** installed
   - Download from: https://www.oracle.com/java/technologies/downloads/
   - Verify installation: `java -version`

2. **MySQL Server** installed and running
   - Download from: https://dev.mysql.com/downloads/mysql/
   - Default port: 3306

3. **Eclipse IDE** (recommended) or any Java IDE
   - Download from: https://www.eclipse.org/downloads/

## Database Setup

### Step 1: Create MySQL User and Database

Open MySQL command line or MySQL Workbench and run:

```sql
-- Create the user
CREATE USER 'XXXX'@'XXXX' IDENTIFIED BY 'XXXXX';

-- Create the database
CREATE DATABASE socialmedia;

-- Grant permissions
GRANT ALL PRIVILEGES ON socialmedia.* TO 'XXXX'@'XXXXXX';
FLUSH PRIVILEGES;

-- Use the database
USE socialmedia;
```

### Step 2: Create Tables

Run the SQL script provided in `database_setup.sql` to create all necessary tables:

```bash
mysql -u user -p socialmedia < database_setup.sql
```

Or manually execute the script in your MySQL client.

## Installation & Running

### Option 1: Using Eclipse IDE

1. **Open the project in Eclipse:**
   ```
   File → Open Projects from File System → Select the project folder
   ```

2. **Clean and build the project:**
   ```
   Project → Clean → Select "Clean all projects"
   ```

3. **Run the application:**
   - Right-click on `Main.java` (in `src/SocialMediaPlatform/Main.java`)
   - Select `Run As → Java Application`

### Option 2: Using Batch Files (Easiest for Windows)

**One-time setup:**
```bash
# Double-click: setup.bat
```

**To run the application:**
```bash
# Double-click: run.bat
```

**To recompile after changes:**
```bash
# Double-click: compile.bat
```

### Option 3: Using Command Line

1. **Navigate to the project directory:**
   ```bash
   cd C:file name\SocialMediaPlatform
   ```

2. **Compile the project:**
   ```bash
   javac -cp "lib/mysql-connector-j-9.3.0.jar;src" -d bin src/SocialMediaPlatform/Main.java src/Model/*.java src/View/*.java src/Controller/*.java
   ```

3. **Run the application:**
   ```bash
   java -cp "bin;lib/mysql-connector-j-9.3.0.jar" SocialMediaPlatform.Main
   ```

   **Note for Linux/Mac users:** Replace semicolons (`;`) with colons (`:`) in the classpath.

## Project Structure

```
SocialMediaPlatform/
├── src/
│   ├── SocialMediaPlatform/
│   │   └── Main.java              # Application entry point
│   ├── Model/
│   │   ├── Database.java          # Database connection
│   │   ├── User.java              # User model
│   │   ├── Post.java              # Post model
│   │   └── Comment.java           # Comment model
│   ├── View/
│   │   ├── Welcome.java           # Welcome screen
│   │   ├── Login.java             # Login screen
│   │   ├── Home.java              # Home/Timeline screen
│   │   └── ...                    # Other UI components
│   └── Controller/
│       ├── CreateUser.java        # User creation logic
│       ├── CreatePost.java        # Post creation logic
│       └── ...                    # Other business logic
├── lib/
│   └── mysql-connector-j-9.3.0.jar # MySQL JDBC driver
├── pics/                          # Image resources
├── bin/                           # Compiled classes
└── README.md                      # This file
```

## Usage

1. **First Time Launch:**
   - The application will start with a colorful Welcome screen
   - Create a new account or login with existing credentials

2. **Try the Demo Account:**
   - **Email:** `XXXX`
   - **Password:** `XXXXXX`
   - Explore a fully populated account with posts, friends, and interactions!

3. **Sample Accounts (all use password: `password123`):**
   - john.doe@example.com
   - jane.smith@example.com
   - alice.w@example.com
   - And 12 more users!

4. **Creating Your Own Account:**
   - Click on "Create Account" from login screen
   - Fill in your details (First Name, Last Name, Email, Password)
   - Start connecting with the community!

5. **Using the Application:**
   - View your personalized timeline with posts from friends
   - Create new posts with emojis and rich content
   - Like and comment on posts
   - Browse and add friends
   - View your posts, comments, and likes
   - Update your profile
   - Change your password

## Troubleshooting

### Database Connection Issues

If you see connection errors:

1. **Check MySQL is running:**
   ```bash
   # Windows
   net start MySQL80
   
   # Or check services: services.msc
   ```

2. **Verify credentials in Database.java:**
   - User: `XXXX`
   - Password: `XXXXXXX`
   - Database: `socialmedia`
   - Port: `3306`

3. **Test connection:**
   ```bash
   mysql -u user -p
   # Enter password: XXXXXXX
   ```

### Compilation Errors

- Ensure you're using Java 17 or higher
- Check that MySQL connector JAR is in the `lib/` folder
- Clean and rebuild the project

### ClassNotFoundException

- Verify the MySQL connector JAR path in `.classpath`
- Ensure the JAR file exists in the `lib/` directory

## Configuration

To modify database settings, edit `src/Model/Database.java`:

```java
private String user = "XXXX";          // MySQL username
private String pass = "XXXXX";  // MySQL password
private String url = "jdbc:mysql://localhost:3306/socialmedia?useSSL=false&serverTimezone=UTC";
```

## Contributing

Feel free to fork this project and submit pull requests for any improvements.

## License

This project is open source and available for educational purposes.

## Author

Created as a Java Swing application demonstrating MVC architecture with MySQL integration.

## Support

For issues or questions, please create an issue in the GitHub repository.
